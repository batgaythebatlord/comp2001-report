CREATE PROCEDURE CW2.updateGeoPoint
    @pointid INT = NUll,
    @latitude FLOAT = NULL,
    @longitude FLOAT = NULL
AS

UPDATE CW2.geo_point
SET latitude = @latitude, longitude = @longitude
WHERE point_ID = @pointid

GO