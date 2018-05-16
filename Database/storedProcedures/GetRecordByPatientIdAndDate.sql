CREATE PROCEDURE GetRecordByPatientIdAndDate
@patient_id int,
@date date
AS
BEGIN
SELECT dbo.medical_records.record_id, dbo.medical_records.record_date, dbo.patients.first_name, dbo.patients.middle_name, dbo.patients.last_name, dbo.diagnoses.diagnosis_name, dbo.sick_leaves.sick_leave_id, 
       dbo.sick_leaves.issued, dbo.sick_leaves.valid_from, dbo.sick_leaves.valid_to, dbo.doctors.first_name AS doctors_first_name, dbo.doctors.last_name AS doctors_last_name, dbo.posts.post_name, 
       dbo.patients.patient_id
FROM dbo.medical_records INNER JOIN
     dbo.patients ON dbo.medical_records.patient_id = dbo.patients.patient_id INNER JOIN
     dbo.doctors ON dbo.medical_records.doctor_id = dbo.doctors.doctor_id INNER JOIN
     dbo.diagnoses ON dbo.medical_records.diagnosis_id = dbo.diagnoses.diagnosis_id INNER JOIN
     dbo.sick_leaves ON dbo.medical_records.sick_leave_id = dbo.sick_leaves.sick_leave_id INNER JOIN
     dbo.posts ON dbo.doctors.post_id = dbo.posts.post_id
WHERE dbo.patients.patient_id = @patient_id AND dbo.medical_records.record_date = @date
END
GO
