CREATE PROCEDURE CW2.createTag
    @tagname VARCHAR(30) = NULL
AS

INSERT INTO CW2.tag(tag_name)
VALUES (@tagname)

GO