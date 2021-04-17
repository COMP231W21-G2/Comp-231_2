

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [SHP].[opeartion_doctors](@doctorId int,@name varchar(200), @docphone varchar(200), @email varchar(200), @spec varchar(200), @action varchar(100))
AS
BEGIN
	IF(@action = 'Delete')
	BEGIN
		DELETE FROM SHP.doctor  WHERE doctor_id = @doctorId
	END
	ELSE IF(@action = 'Update')
	BEGIN
		UPDATE SHP.doctor   SET name = @name, email =@email, phone = @docphone, specialised_in= @spec  where doctor_id =  @doctorId
	END
	ELSE
	BEGIN
		Insert into SHP.doctor (name, phone, email, specialised_in)
		VALUES
		(@name, @docphone, @email, @spec)
	END
END
