USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[AddMedRecordAndSickLeave]    Script Date: 09.06.2018 21:20:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddMedRecordAndSickLeave]
@patient_id int,
@diagnosis_id int,
@doctor_id int
AS
BEGIN
INSERT INTO dbo.sick_leaves
VALUES(0, NULL, NULL)
INSERT INTO dbo.medical_records
VALUES(GETDATE() ,@patient_id, @diagnosis_id, @doctor_id, @@IDENTITY)
END
GO