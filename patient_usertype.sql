
Alter table [SHP].[user_details] add  IsUserVerified bit;

GO
Update [SHP].[user_details]  set IsUserVerified = 1 where user_type = 'admin';

GO


ALTER PROCEDURE [SHP].[check_login_status](@username varchar(100), @password varchar(200), @type varchar(200))
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT 1 FROM SHP.user_passwrod WHERE email = @username AND password = @password AND user_type =  @type)
	BEGIN
		SELECT userid, email, name, user_type, IsUserVerified FROM SHP.user_details WHERE email = @username;		
	END
END

GO
