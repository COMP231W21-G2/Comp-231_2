
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [SHP].[opeartion_users_byadmin](@userId int,@name varchar(200), @address varchar(200),@dob datetime, @phone varchar(200), @email varchar(200),
@action varchar(100) )
AS
BEGIN
	IF(@action = 'Insert')
	BEGIN
		Insert into SHP.user_details (name,address, dob, phone_no, email,  user_type)
		VALUES
		(@name, @address, @dob, @phone, @email,  'Patient');
		Select 1;
	END
	IF(@action = 'Delete')
	BEGIN
		DELETE FROM SHP.user_details  WHERE userid = @userId ;
		Select 1;
	END
	ELSE IF(@action = 'Update')
	BEGIN
		UPDATE SHP.user_details   SET name = @name, email =@email, phone_no = @phone, address= @address, dob= @dob  where userid = @userId ;
		Select 1;
	END
	ELSE
	BEGIN
		SELECT userid, name, address, CONVERT(date, dob) as dob, email, user_type, phone_no, CONVERT(date, created_on) as created_on
		FROM SHP.user_details WHERE user_type <> 'admin';
		
	END
END

