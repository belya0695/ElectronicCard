USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetAllDiagnoses]    Script Date: 09.06.2018 19:50:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllDiagnoses]
AS
BEGIN
SELECT *
FROM dbo.diagnoses
END
GO