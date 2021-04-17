
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [SHP].[get_user](
@userid int)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT userid, name, address, dob, email, phone_no, med_history , [user_type]
	FROM SHP.user_details WHERE userid = @userid; 
END

