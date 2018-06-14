USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[AddDiagnosis]    Script Date: 09.06.2018 21:19:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddDiagnosis]
@diag_name nvarchar(100)
AS
BEGIN
INSERT INTO dbo.diagnoses
VALUES(@diag_name)
END
GO