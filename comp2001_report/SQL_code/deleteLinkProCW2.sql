CREATE PROCEDURE CW2.deleteLink
    @tagid INT = NULL,
    @trailid INT = NULL
AS

DELETE FROM CW2.trail_tag_link WHERE tag_ID = @tagid AND trail_ID = @trailid

GO