USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDiagnosis]    Script Date: 09.06.2018 22:27:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDiagnosis]
@diag_id int,
@diag_name nvarchar(150)
AS
BEGIN
UPDATE [dbo].diagnoses
   SET diagnosis_name = @diag_name
   WHERE diagnosis_id = @diag_id
END
GO