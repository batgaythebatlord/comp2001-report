CREATE PROCEDURE CW2.updateTrial2
    @trailid INT = NUll,
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

UPDATE CW2.trail
SET trail_name = @trailname, trail_length = @traillength, elevation_gain = @elevationgain, trail_description = @traildescription, 
route_type = @routetype, difficulty = @difficulty, rating = @rating, est_time = @esttime, location_name = @locationname, owner_ID = @ownerid
WHERE trail_ID = @trailid

GO