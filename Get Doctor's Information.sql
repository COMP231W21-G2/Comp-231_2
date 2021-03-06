
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [SHP].[get_doctors_list](@symptoms varchar(max))
AS
BEGIN
	SET NOCOUNT ON;
	if(CHARINDEX('cough',@symptoms) > 0 OR CHARINDEX('fever',@symptoms) > 0)
	BEGIN
		SELECT * from  SHP.doctor  WHERE doctor_id in (1,5);
	END
	else if(@symptoms = 'brain')
	BEGIN
		SELECT * from  SHP.doctor where doctor_id = 6; 
	END
	else if(@symptoms = 'DE')
	BEGIN
		SELECT * from  SHP.doctor ; 
	END
	ELSE
	BEGIN
		SELECT name, doctor_id from  SHP.doctor ; 
	END

END
