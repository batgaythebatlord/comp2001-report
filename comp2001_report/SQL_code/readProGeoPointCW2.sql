CREATE PROCEDURE CW2.readGeoPoint
    @pointid INT = NUll
AS

SELECT trail_name, latitude, longitude

FROM CW2.geo_point
INNER JOIN CW2.trail_geo_point
ON CW2.geo_point.point_ID = CW2.trail_geo_point.point_ID
INNER JOIN CW2.trail
ON CW2.trail.trail_ID = CW2.trail_geo_point.trail_ID

WHERE CW2.geo_point.point_ID = @pointid

GO