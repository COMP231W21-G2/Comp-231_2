Alter table SHP.[schedule_appointment] add appt_type varchar(100) default 'Virtual'; 
Alter table SHP.patients_details add user_type varchar(100);
Alter table SHP.user_passwrod add user_type varchar(100);

ALter procedure SHP.insert_schedule_appointments(@patientId int, @doctorId int, @date date, @time time, @type varchar(100))
AS
BEGIN
	SET NOCOUNT ON;

	
    INSERT INTO SHP.schedule_appointment (doctor_id, patient_id, [date], [time], appt_type)
	VALUES
	(@doctorId, @patientId, @date, @time, @type);
END

/*
	select * from SHP.user_details; 
	select * from SHP.user_passwrod
	select * from SHP.schedule_appointment
*/

ALTER PROCEDURE SHP.check_login_status(@username varchar(100), @password varchar(200), @type varchar(200))
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT 1 FROM SHP.user_passwrod WHERE email = @username AND password = @password AND user_type =  @type)
	BEGIN
		SELECT userid, email, name, user_type FROM SHP.user_details WHERE email = @username;		
	END
END

SELECT * FROM SHP.user_passwrod WHERE email = 'rasingh1@gmail.com' AND password = 'ravinder' AND user_type =  'Patient' 

DROP Procedure SHP.patient_create;

Create table SHP.user_details
(
userid int identity primary key,
name varchar(1000) not null,
address varchar(2000),
dob datetime,
phone_no varchar(100),
email varchar(200) unique,
med_history varchar(1000),
user_type varchar(100)
)

CREATE Procedure SHP.user_create(
@name varchar(1000), @password varchar(200),
@address varchar(2000), @dob datetime,  @email varchar(200), @type varchar(200) )
AS
BEGIN
	INSERT INTO SHP.user_details (name, address, dob,  email, user_type)
	VALUES
	(@name, @address, @dob, @email,@type);

	Declare @uid int;
	Select @uid = @@identity;
	-- Update SHP.user_details SET patient_no = 'P_' + CAST(@pid AS VARCHAR(100)) WHERE patient_id = @pid;

	INSERT Into SHP.user_passwrod(username, email, password, user_type) VALUES (@name, @email,@password,@type );

	SELECT @uid
END

Alter table SHP.lab_appointment add lab_test_id int

-- select * from SHP.lab_appointment

-- SHP.get_lab_appointments 0

Alter procedure SHP.get_lab_appointments(@patientId int)
AS
BEGIN
	SET NOCOUNT ON;

	IF(@patientId IS NULL OR @patientId =0)
	BEGIN
		SELECT lab_booking_id , name , address as Address, t.test_name As labtest, patient_id, [date], [time] AS Time
		FROM SHP.lab_appointment l
		join  SHP.user_details u on l.patient_id = u.userid
		join SHP.lab_test t on t.id = l.lab_test_id;
	END
	ELSE
	BEGIN
		SELECT lab_booking_id , name, address as Address, t.test_name As labtest, patient_id, [date], [time] AS Time
		FROM SHP.lab_appointment l
		join  SHP.user_details u on l.patient_id = u.userid
		join SHP.lab_test t on t.id = l.lab_test_id
		WHERE patient_id = @patientId;
	END	
END


Create procedure SHP.get_lab_appointments_for_date(@date date)
AS
BEGIN
	SET NOCOUNT ON;
	
		SELECT lab_booking_id , name , address as Address, t.test_name As labtest, patient_id, [date], [time] AS Time
		FROM SHP.lab_appointment l
		join  SHP.user_details u on l.patient_id = u.userid
		join SHP.lab_test t on t.id = l.lab_test_id
		WHERE l.date = @date;	
END


Alter procedure SHP.insert_lab_appointments(@patientId int, @labTestId int, @date date, @time time, @type varchar(1000))
AS
BEGIN
	SET NOCOUNT ON;

	
    INSERT INTO SHP.lab_appointment (lab_test_id, patient_id, [date], [time], report_type)
	VALUES
	(@labTestId, @patientId, @date, @time, @type)
		
END

/*
select * from SHP.lab_appointment
select *  FROM SHP.user_details
*/

Create Procedure SHP.get_user(
@userid int)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT userid, name, address, dob, email, phone_no, med_history , [user_type]
	FROM SHP.user_details WHERE userid = @userid; 
END



Create Procedure SHP.user_update(
@userId int, @name varchar(1000), @phone varchar(200),
@address varchar(2000), @dob datetime,@med varchar(max) )
AS
BEGIN

	UPDATE SHP.user_details
	SET name = @name,  phone_no =@phone, address = @address, dob =@dob, med_history = @med
	WHERE userid = @userId;

END


Alter procedure SHP.insert_lab_appointment_result(@labBookingId int, @result varchar(100), @comments varchar(1000))
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO SHP.lab_appointment_result (lab_booking_id, [result], comments)
	VALUES
	(@labBookingId, @result, @comments);
END

Alter procedure SHP.get_lab_appointment_result(@labBookingId int)
AS
BEGIN
	SET NOCOUNT ON;
	IF(@labBookingId IS NULL OR @labBookingId = 0)
	BEGIN
		SELECT  lab_booking_id, [result], comments FROM SHP.lab_appointment_result;
	END
	ELSE
	BEGIN
		SELECT  lab_booking_id, [result], comments FROM SHP.lab_appointment_result WHERE lab_booking_id = @labBookingId ;
	END
END

Alter procedure SHP.get_lab_appointment_results(@patientId int)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT * FROM SHP.lab_appointment_result r
	join SHP.lab_appointment a ON r.lab_booking_id = a.lab_booking_id
	join SHP.lab_test t on t.id = a.lab_test_id
	WHERE patient_id = @patientId;
	
END

-- select * from SHP.lab_appointment