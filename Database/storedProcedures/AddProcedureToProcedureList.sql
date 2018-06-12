USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[AddProcedureToProcedureList]    Script Date: 09.06.2018 21:21:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddProcedureToProcedureList]
@record_id int,
@proc_id int,
@mode nvarchar(300),
@duration int
AS
BEGIN
INSERT INTO dbo.procedures_lists
VALUES(@record_id, @proc_id, @mode, @duration)
END
GO