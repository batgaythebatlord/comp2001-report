CREATE PROCEDURE CW2.deleteTrailGeoPoint
    @trailid INT = NULL,
    @pointid INT = NUll
AS

DELETE FROM CW2.trail_geo_point WHERE point_ID = @pointid AND trail_ID = @trailid

GO