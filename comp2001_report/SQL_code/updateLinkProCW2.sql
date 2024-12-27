CREATE PROCEDURE CW2.updateLink
    @currenttagid INT = NULL,
    @currenttrailid INT = NULL,
    @newtagid INT = NULL,   
    @newtrailid INT = NULL
AS

UPDATE CW2.trail_tag_link
SET tag_ID = @newtagid, trail_ID = @newtrailid
WHERE tag_ID = @currenttagid AND trail_ID = @currenttrailid 

GO