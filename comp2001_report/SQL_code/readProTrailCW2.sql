CREATE PROCEDURE CW2.readTrail2
    @trailid INT = NUll
AS

SELECT trail_name, tag_name

FROM CW2.trail
INNER JOIN CW2.trail_tag_link
ON CW2.trail.trail_ID = CW2.trail_tag_link.trail_ID
INNER JOIN CW2.tag
ON CW2.tag.tag_ID = CW2.trail_tag_link.tag_ID

WHERE CW2.trail.trail_ID = @trailid

GO