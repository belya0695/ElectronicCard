USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetAllPatients]    Script Date: 11.06.2018 18:54:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllPatients]
@doctor_id int
AS
BEGIN
SELECT dbo.users.[user_id], first_name, middle_name, last_name, birthdate
FROM dbo.users INNER JOIN dbo.medical_records ON dbo.users.user_id = dbo.medical_records.patient_id
WHERE dbo.medical_records.doctor_id = @doctor_id
GROUP BY dbo.users.[user_id], first_name, middle_name, last_name, birthdate
END
GO