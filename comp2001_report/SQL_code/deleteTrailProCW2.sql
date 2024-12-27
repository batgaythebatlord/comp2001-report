CREATE PROCEDURE CW2.deleteTrail2
    @trailid INT = NUll
AS

DELETE FROM CW2.trail WHERE trail_ID = @trailid
DELETE FROM CW2.trail_tag_link WHERE trail_ID = @trailid
DELETE FROM CW2.trail_geo_point WHERE trail_ID = @trailid

GO