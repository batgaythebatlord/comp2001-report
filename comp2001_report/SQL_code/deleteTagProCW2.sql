CREATE PROCEDURE CW2.deleteTag
    @tagid INT = NUll
AS

DELETE FROM CW2.tag WHERE tag_ID = @tagid
DELETE FROM CW2.trail_tag_link WHERE tag_ID = @tagid

GO