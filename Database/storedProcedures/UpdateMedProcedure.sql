USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[UpdateMedProcedure]    Script Date: 09.06.2018 22:28:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateMedProcedure]
@proc_id int,
@proc_name nvarchar(100)
AS
BEGIN
UPDATE [dbo].medical_procedures
   SET procedure_name = @proc_name
   WHERE procedure_id = @proc_id
END
GO