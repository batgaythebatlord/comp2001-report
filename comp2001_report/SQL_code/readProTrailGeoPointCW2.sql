CREATE PROCEDURE CW2.readTrailGeoPoint
    @pointid INT = NULL,
    @trailid INT = NULL
AS

SELECT point_ID, trail_ID

FROM CW2.trail_geo_point

WHERE CW2.trail_geo_point.point_ID = @pointid AND CW2.trail_geo_point.trail_ID = @trailid

GO