USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetProcedureById]    Script Date: 11.06.2018 10:45:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetProcedureById]
@proc_id int
AS
BEGIN
SELECT *
FROM medical_procedures
WHERE medical_procedures.procedure_id = @proc_id
END
GO