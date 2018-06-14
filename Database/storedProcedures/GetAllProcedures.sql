USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetAllProcedures]    Script Date: 09.06.2018 19:11:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllProcedures]
AS
BEGIN
SELECT *
FROM dbo.medical_procedures
END
GO