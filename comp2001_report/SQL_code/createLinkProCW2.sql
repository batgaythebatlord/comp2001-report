CREATE PROCEDURE CW2.createLink
    @tagID INT = NULL,
    @trailID INT = NULL
AS

INSERT INTO CW2.trail_tag_link(tag_ID, trail_ID)
VALUES (@tagID, @trailID)

GO