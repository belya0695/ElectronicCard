USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetProceduresListsByRecordId]    Script Date: 10.06.2018 15:21:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetProceduresListsByRecordId]
@record_id int
AS
BEGIN
SELECT *, dbo.medical_procedures.procedure_name
FROM dbo.procedures_lists INNER JOIN dbo.medical_procedures ON dbo.procedures_lists.procedure_id = dbo.medical_procedures.procedure_id
WHERE dbo.procedures_lists.record_id = @record_id
END
GO