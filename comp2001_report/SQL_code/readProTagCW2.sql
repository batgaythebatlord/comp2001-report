CREATE PROCEDURE CW2.readTag2
    @tagid INT = NUll
AS

SELECT trail_name, tag_name

FROM CW2.tag
INNER JOIN CW2.trail_tag_link
ON CW2.tag.tag_ID = CW2.trail_tag_link.tag_ID
INNER JOIN CW2.trail
ON CW2.trail.trail_ID = CW2.trail_tag_link.trail_ID

WHERE CW2.tag.tag_ID = @tagid

GO