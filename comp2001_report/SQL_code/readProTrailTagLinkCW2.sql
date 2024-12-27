CREATE PROCEDURE CW2.readTrailTagLink
    @tagid INT = NULL,
    @trailid INT = NULL
AS

SELECT tag_ID, trail_ID

FROM CW2.trail_tag_link

WHERE CW2.trail_tag_link.tag_ID = @tagid AND CW2.trail_tag_link.trail_ID = @trailid

GO