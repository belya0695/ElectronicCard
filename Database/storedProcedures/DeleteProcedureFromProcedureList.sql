USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[DeleteProcedureFromProcedureList]    Script Date: 09.06.2018 23:14:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteProcedureFromProcedureList]
@record_id int,
@proc_id int
AS
BEGIN
DELETE FROM [dbo].procedures_lists
      WHERE record_id = @record_id AND procedure_id = @proc_id
END
GO