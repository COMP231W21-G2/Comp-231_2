
GO
Create table SHP.lab_appointment_result
(
id int identity,
lab_booking_id int,
[result] varchar(100),
comments varchar(1000),
constraint fk_lab_booking_id_result foreign key  (lab_booking_id) references SHP.lab_appointment(lab_booking_id),
)

Create procedure SHP.get_lab_appointment_results(@patientId int)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT * FROM SHP.lab_appointment_result r
	join SHP.lab_appointment a ON r.lab_booking_id = a.lab_booking_id
	join SHP.lab_test t on t.id = a.lab_test_id
	WHERE patient_id = @patientId;
	
END



Create procedure SHP.insert_lab_appointment_result(@labBookingId int, @result varchar(100), @comments varchar(1000))
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO SHP.lab_appointment_result (lab_booking_id, [result], comments)
	VALUES
	(@labBookingId, @result, @comments);
END