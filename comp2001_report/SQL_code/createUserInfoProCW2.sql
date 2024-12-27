CREATE PROCEDURE CW2.createUserInfo
    @emailaddress VARCHAR(100) = NULL,
    @roleheld VARCHAR(50) = NULL
AS

INSERT INTO CW2.user_info(email_address, role_held)
VALUES (@emailaddress, @roleheld)

GO