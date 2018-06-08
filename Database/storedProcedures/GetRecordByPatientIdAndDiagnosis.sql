USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetRecordByPatientIdAndDiagnosis]    Script Date: 08.06.2018 19:56:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetRecordByPatientIdAndDiagnosis]
@patient_id int,
@diagnosis nvarchar(40)
AS
BEGIN
SELECT dbo.medical_records.record_id, dbo.medical_records.record_date, patients.first_name, patients.middle_name, patients.last_name, dbo.diagnoses.diagnosis_name, dbo.sick_leaves.sick_leave_id, 
       dbo.sick_leaves.issued, dbo.sick_leaves.valid_from, dbo.sick_leaves.valid_to, doctors.first_name AS doctors_first_name, doctors.last_name AS doctors_last_name, dbo.posts.post_name,
       patients.[user_id]
FROM dbo.medical_records INNER JOIN
     dbo.users AS patients ON dbo.medical_records.patient_id = patients.[user_id] INNER JOIN
     dbo.users AS doctors ON dbo.medical_records.doctor_id = doctors.[user_id] INNER JOIN
     dbo.diagnoses ON dbo.medical_records.diagnosis_id = dbo.diagnoses.diagnosis_id INNER JOIN
     dbo.sick_leaves ON dbo.medical_records.sick_leave_id = dbo.sick_leaves.sick_leave_id INNER JOIN
     dbo.posts ON doctors.post_id = dbo.posts.post_id
WHERE dbo.medical_records.patient_id = @patient_id AND dbo.diagnoses.diagnosis_name = @diagnosis
END
GO