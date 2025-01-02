from flask import abort, make_response, request, Request
import requests
from config import db
from models import TrailGeoPoint, TrailGeoPointSchema, GeoPoint, GeoPointSchema, Trail, TrailSchema, User
import json

AUTH_URL = "https://web.socem.plymouth.ac.uk/COMP2001/auth/api/users"

def is_user_admin(user):
    return user.role == 'ADMIN'

def get_user(req: Request):
    email = request.headers.get("x-email")
    user = User.query.filter(User.email == email).one_or_none()

    return user

def is_user_real(req: Request):
    """Will return True if the user is an admin via the auth API"""

    email = req.headers.get("x-email")
    password = req.headers.get("x-password")

    if email is None or password is None:
        return False

    body = {"email": email, "password": password}
    response = requests.post(AUTH_URL, json=body)

    response = response.json()

    return response[1] == 'True'

def read_all():
    trails = Trail.query.all()

    return TrailSchema(many=True).dump(trails)

def get_point(TrailGeoPoint):
    point = Point.query.filter(GeoPoint.point_id == TrailGeoPoint.point_id).one_or_none()
    if point is None:
        return None

    return {
        "oder_no": TrailGeoPoint.order_no,
        "latitude": GeoPoint.latitude,
        "longitude": GeoPoint.longitude
    }

def read_one(trail_id):
    trail = Trail.query.filter(Trail.trail_id == trail_id).one_or_none()
    if trail is None:
        abort(404, f"Trail with ID {trail_id} not found")

    points = map(get_point, trail.TrailGeoPoint)
    points = list(filter(None, points))

    trail = TrailSchema().dump(trail);

    return json.loads(json.dumps(trail)) | {"points": points}

def create():
    if is_user_real(request) == False:
        abort(401, "Unauthorized credentials")

    user = get_user(request)
    if user is None or is_user_admin(user) == False:
        abort(401, "Unauthorized credentials")

    trail = request.get_json()

    points = trail['points']
    trail = {
        "owner_ID": user.user_id,
        "name": trail['trail_name'],
        "length": trail['trail_length'],
        "elevation_gain": trail['elevation_gain'],
        "description": trail['trail_description'],
        "route_type": trail['route_type'],
        "difficulty": trail['difficulty'],
        "location": trail['location_name']
    }
    new_trail = TrailSchema().load(trail, session=db.session)
    db.session.add(new_trail)
    db.session.commit()

    # add points to trail_points
    for GeoPoint in points:
        p = {
            "longitude": point['longitude'],
            "latitude": point['latitude']
        }
        new_point = GeoPointSchema().load(p, session=db.session)
        db.session.add(new_point)
        db.session.commit()

        p = {
            "trail_id": new_trail.trail_id,
            "point_id": new_point.point_id,
            "order_no": point['order_no']
        }
        new_trail_point = TrailGeoPointSchema().load(p, session=db.session)
        db.session.add(new_trail_point)

    db.session.commit()
    return TrailSchema().dump(new_trail), 201

def update(trail_id):
    if is_user_real(request) == False:
        abort(401, "Unauthorized credentials")

    user = get_user(request)
    if user is None or is_user_admin(user) == False:
        abort(401, "Unauthorized credentials")

    existing_trail = Trail.query.filter(Trail.trail_id == trail_id).one_or_none()

    if existing_trail is None:
        abort(404, f"Trail with ID {trail_id} not found")

    new_trail = request.get_json()
    new_trail['trail_id'] = trail_id
    new_trail['author_id'] = user.user_id

    new_trail = TrailSchema().load(new_trail, session=db.session)

    db.session.merge(new_trail)
    db.session.commit()

    return TrailSchema().dump(new_trail), 201

def delete(trail_id):
    if is_user_real(request) == False:
        abort(401, "Unauthorized credentials")

    user = get_user(request)
    if user is None or is_user_admin(user) == False:
        abort(401, "Unauthorized credentials")

    trail = Trail.query.filter(Trail.trail_id == trail_id).one_or_none()

    if trail is None:
        abort(404, f"Trail with ID {trail_id} not found")

    for point in trail.trail_points:
        db.session.delete(point)

    db.session.delete(trail)
    db.session.commit()

    return make_response(f"Trail with ID {trail_id} deleted", 200)
