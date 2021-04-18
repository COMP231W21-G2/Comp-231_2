/****** Object:  StoredProcedure [SHP].[get_appointments]    Script Date: 2021-04-18 1:45:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [SHP].[get_appointments](@patientId int)
AS
BEGIN
	SET NOCOUNT ON;

	IF(@patientId IS NULL OR @patientId =0)
	BEGIN
		SELECT *
		FROM SHP.[schedule_appointment];
	END
	ELSE
	BEGIN
		SELECT *
		FROM SHP.[schedule_appointment]
		WHERE patient_id = @patientId;
	END	
END