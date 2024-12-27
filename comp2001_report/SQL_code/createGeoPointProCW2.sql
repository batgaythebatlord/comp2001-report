CREATE PROCEDURE CW2.createGeoPoint
    @latitude FLOAT = NULL,
    @longitude FLOAT = NULL
AS

INSERT INTO CW2.geo_point(latitude, longitude)
VALUES (@latitude, @longitude)

GO