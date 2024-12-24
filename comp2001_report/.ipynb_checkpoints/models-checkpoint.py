# models.py

from datetime import datetime
# from zoneinfo import ZoneInfo
import pytz

from config import db, ma
from marshmallow_sqlalchemy import fields
from marshmallow import fields

class TrailGeoPoint(db.Model):
    __tablename__ = "trail_geo_point"
    __table_args__ = {'schema': 'CW2', "extend_existing": True}

    trail_id = db.Column(db.Integer, db.ForeignKey("CW2.trails.trail_id"), primary_key=True)
    point_id = db.Column(db.Integer, db.ForeignKey("CW2.points.point_id"), primary_key=True)
    order_no = db.Column(db.Integer, nullable=True)

class TrailGeoPointSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = TrailGeoPoint
        load_instance = True
        sqla_session = db.session

    trail_id = fields.Integer(required=True)
    point_id = fields.Integer(required=True)

class Trail(db.Model):
    __tablename__ = "trail"
    __table_args__ = {'schema': 'CW2', "extend_existing": True}

    trail_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    trail_name = db.Column(db.Text, nullable=False)
    length = db.Column(db.Integer, nullable=True)
    elevation_gain = db.Column(db.Integer, nullable=True)
    trail_description = db.Column(db.Text, nullable=True)
    route_type = db.Column(db.Text, nullable=True)
    difficulty = db.Column(db.Text, nullable=True)
    rating = db.Column(db.Float, nullable=True)
    location_name = db.Column(db.Text, nullable=True)
    owner_ID = db.Column(db.Integer, db.ForeignKey("CW2.user_info.user_id"), nullable=True)

    trail_geo_point = db.relationship(TrailPoint, backref="trail_trail_points", single_parent=True)

class TrailSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = Trail
        load_instance = True
        sqla_session = db.session

    author_id = fields.Integer(required=True)

class GeoPoint(db.Model):
    __tablename__ = "geo_point"
    __table_args__ = {'schema': 'CW2', "extend_existing": True}

    point_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    longitude = db.Column(db.Float, nullable=False)
    latitude = db.Column(db.Float, nullable=False)

    trail_geo_point = db.relationship(TrailPoint, backref="point_trail_points", single_parent=True)

class GeoPointSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = GeoPoint
        load_instance = True
        sqla_session = db.session

class User(db.Model):
    __tablename__ = "users"
    __table_args__ = {'schema': 'CW2', "extend_existing": True}

    user_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    email_address = db.Column(db.Text, nullable=False)
    role_held = db.Column(db.Text, nullable=False)

    trail = db.relationship(Trail, backref="author", single_parent=True)