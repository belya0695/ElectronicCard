USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[DeleteMedProcedure]    Script Date: 09.06.2018 23:13:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteMedProcedure]
@proc_id int
AS
BEGIN
DELETE FROM [dbo].medical_procedures
      WHERE procedure_id = @proc_id
END
GO