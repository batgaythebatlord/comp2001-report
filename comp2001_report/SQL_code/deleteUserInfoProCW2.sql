CREATE PROCEDURE CW2.deleteUserInfo
    @userid INT = NULL
AS

UPDATE CW2.trail
SET owner_ID = NULL
WHERE owner_ID = @userid

DELETE FROM CW2.user_info WHERE user_ID = @userid

GO