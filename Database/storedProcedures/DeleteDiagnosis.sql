USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[DeleteDiagnosis]    Script Date: 09.06.2018 23:13:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteDiagnosis]
@diag_id int
AS
BEGIN
DELETE FROM [dbo].[diagnoses]
      WHERE diagnosis_id = @diag_id
END
GO