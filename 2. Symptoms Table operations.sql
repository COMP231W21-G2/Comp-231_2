
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SHP].[symptoms](
[id] [int] IDENTITY(1,1) NOT NULL,
[symptom] [varchar](200) NULL
) ON [PRIMARY]

GO
CREATE procedure [SHP].[opeartion_symptoms_byadmin](@name varchar(200),@action varchar(100) )
AS
BEGIN
	IF(@action = 'IT')
	BEGIN
		Insert into SHP.symptoms (symptom) 		VALUES 		(@name);
		Select 1;
	END
	IF(@action = 'DT')
	BEGIN
		DELETE FROM SHP.symptoms  WHERE symptom = @name ;
		Select 1;
	END
	ELSE IF(@action = 'U')
	BEGIN
		UPDATE SHP.symptoms   SET symptom = @name where symptom = @name ;
		
	END
	ELSE
	BEGIN
		SELECT * FROM SHP.symptoms ;
		
	END
END