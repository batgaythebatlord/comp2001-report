CREATE PROCEDURE CW2.updateUserInfo
    @userid INT = NULL,
    @emailaddress VARCHAR(100) = NULL,
    @roleheld VARCHAR(50) = NULL
AS

UPDATE CW2.user_info
SET email_address = @emailaddress, role_held = @roleheld
WHERE user_ID = @userid

GO