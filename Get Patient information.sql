/****** Object:  StoredProcedure [SHP].[get_user]    Script Date: 2021-04-16 7:43:12 PM ******/
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
