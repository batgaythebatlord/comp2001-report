CREATE PROCEDURE CW2.updateTag
    @tagid INT = NUll,
    @tagname VARCHAR(30) = NULL
AS

UPDATE CW2.tag
SET tag_name = @tagname
WHERE tag_ID = @tagid

GO