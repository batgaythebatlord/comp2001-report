CREATE PROCEDURE CW2.deleteGeoPoint
    @pointid INT = NUll
AS

DELETE FROM CW2.geo_point WHERE point_ID = @pointid
DELETE FROM CW2.trail_geo_point WHERE point_ID = @pointid

GO