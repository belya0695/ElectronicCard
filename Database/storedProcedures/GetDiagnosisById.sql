USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetDiagnosisById]    Script Date: 11.06.2018 10:44:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetDiagnosisById]
@diag_id int
AS
BEGIN
SELECT *
FROM diagnoses
WHERE diagnoses.diagnosis_id = @diag_id
END
GO