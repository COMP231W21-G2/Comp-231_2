
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [SHP].[get_appointments](@patientId int)
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
		FROM SHP.[Schedule_appointment]
		WHERE patient_id = @patientId;
	END	
END
