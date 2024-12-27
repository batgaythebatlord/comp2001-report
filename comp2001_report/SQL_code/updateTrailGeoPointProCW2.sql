CREATE PROCEDURE CW2.updateTrailGeoPoint
    @currenttrailid INT = NULL,
    @currentpointid INT = NULL,
    @newtrailid INT = NULL,
    @newpointid INT = NULL,
    @orderno INT = NULL
AS

UPDATE CW2.trail_geo_point
SET trail_ID = @newtrailid, point_ID = @newpointid, order_no = @orderno
WHERE trail_ID = @currenttrailid AND point_id = @currentpointid 

GO