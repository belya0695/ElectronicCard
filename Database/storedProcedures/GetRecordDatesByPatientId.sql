USE [EC.DB]
GO
/****** Object:  StoredProcedure [dbo].[GetRecordDatesByPatientId]    Script Date: 02.06.2018 18:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRecordDatesByPatientId]
@patient_id int
AS
BEGIN
SELECT dbo.medical_records.record_date, dbo.medical_records.record_id
FROM dbo.medical_records
WHERE dbo.medical_records.patient_id = @patient_id
END
GO