

-- get patient information
Create Procedure SHP.get_user(
@userid int)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT userid, name, address, dob, email, phone_no, med_history , [user_type]
	FROM SHP.user_details WHERE userid = @userid; 
END

-- Update patient information


Create Procedure SHP.user_update(
@userId int, @name varchar(1000), @phone varchar(200),
@address varchar(2000), @dob datetime,@med varchar(max) )
AS
BEGIN

	UPDATE SHP.user_details
	SET name = @name,  phone_no =@phone, address = @address, dob =@dob, med_history = @med
	WHERE userid = @userId And user_type = 'Patient';

END