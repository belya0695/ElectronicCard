USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[UpdateProcedureList]    Script Date: 09.06.2018 22:28:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateProcedureList]
@record_id int,
@proc_id int,
@mode nvarchar(300), 
@duration int 
AS
BEGIN
UPDATE [dbo].procedures_lists
   SET administration_mode = @mode,
   treatment_duration = @duration
   WHERE record_id = @record_id AND procedure_id = @proc_id
END
GO