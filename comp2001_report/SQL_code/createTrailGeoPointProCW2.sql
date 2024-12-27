CREATE PROCEDURE CW2.createTrailGeoPoint
    @trailid INT = NULL,
    @pointid INT = NULL,
    @orderno INT = NULL
AS

INSERT INTO CW2.trail_geo_point(trail_ID, point_ID, order_no)
VALUES (@trailid, @pointid, @orderno)

GO