CREATE PROCEDURE CW2.readUserInfo
    @userid INT = NUll
AS

SELECT email_address

FROM CW2.user_info

WHERE CW2.user_info.user_ID = @userid

GO