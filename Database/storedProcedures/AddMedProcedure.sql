USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[AddMedProcedure]    Script Date: 09.06.2018 21:20:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddMedProcedure]
@proc_name nvarchar(100)
AS
BEGIN
INSERT INTO dbo.medical_procedures
VALUES(@proc_name)
END
GO