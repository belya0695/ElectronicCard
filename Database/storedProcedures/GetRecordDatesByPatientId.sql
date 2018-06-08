USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetRecordDatesByPatientId]    Script Date: 07.06.2018 15:48:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetRecordDatesByPatientId]
@patient_id int
AS
BEGIN
SELECT dbo.medical_records.record_date
FROM dbo.medical_records
WHERE dbo.medical_records.patient_id = @patient_id
GROUP BY dbo.medical_records.record_date
END
GO