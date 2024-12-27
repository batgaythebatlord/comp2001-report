CREATE PROCEDURE CW2.createTrial2
    @trailname VARCHAR(100) = NULL,
    @traillength FLOAT = NULL,
    @elevationgain INT = NULL,
    @traildescription VARCHAR(500) = NULL,
    @routetype VARCHAR(15) = NULL,
    @difficulty VARCHAR(15) = NULL,
    @rating DECIMAL = NULL,
    @esttime TIME = NULL,
    @locationname VARCHAR(500) = NULL,
    @ownerid INT = NULL
AS

INSERT INTO CW2.trail(trail_name, trail_length, elevation_gain, trail_description, route_type, difficulty, rating, est_time, location_name, owner_ID)
VALUES (@trailname, @traillength, @elevationgain, @traildescription, @routetype, @difficulty, @rating, @esttime, @locationname, @ownerid)

GO