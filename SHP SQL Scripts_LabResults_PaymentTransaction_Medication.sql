GO
Create table SHP.lab_results
(
id int identity primary key,
patient_id int,
report_type varchar(200),
submitted_date datetime,
collected_date datetime,
constraint fk_lab_result_patient foreign key  (patient_id) references SHP.patients_details(patient_id)
)

GO
Create table SHP.payment_transactions
(
transaction_id int identity primary key,
patient_id int,
card_no varchar(100),
card_type varchar(100),
transaction_date datetime,
amount numeric(7,2),
constraint fk_payment_tran_patient foreign key  (patient_id) references SHP.patients_details(patient_id)
)


GO
CReate procedure SHP.get_payment_transaction(@patientId int)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT transaction_id, patient_id, card_no, card_type, transaction_date, amount
	FROM SHP.payment_transactions WHERE patient_id = @patientId;
END


GO
Create procedure SHP.insert_payment_transaction(@patientId int, @cardno varchar(100), @cardtype varchar(100), @tdate datetime, @amt numeric(7,2))
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO SHP.payment_transactions(patient_id, card_no, card_type, transaction_date, amount)
	VALUES
	(@patientId, @cardno, @cardtype, @tdate, @amt);
END

GO
Create table SHP.medical_report
(
id int identity primary key,
patient_id int,
doctor_id int,
collected_date datetime,
constraint fk_medical_rpt_doctor  foreign key  (doctor_id) references SHP.doctor(doctor_id),
constraint fk_medical_rpt_patient foreign key  (patient_id) references SHP.patients_details(patient_id)
)

GO
Create table SHP.medication_information
(
product_id int identity primary key,
product_name varchar(1000),
ordered_date datetime
)


GO
CREATE PROCEDURE SHP.get_all_medicines
AS
BEGIN
	SET NOCOUNT ON;
	SELECT product_id, product_name FROM SHP.medication_information;
END