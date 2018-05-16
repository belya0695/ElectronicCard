CREATE PROCEDURE GetAllPatients
AS
BEGIN
SELECT patient_id, first_name, middle_name, last_name, birthdate, workplace
FROM dbo.patients
END
GO
