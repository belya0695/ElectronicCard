USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[AddDrug]    Script Date: 09.06.2018 21:19:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddDrug]
@drug_name nvarchar(100)
AS
BEGIN
INSERT INTO dbo.drugs
VALUES(@drug_name)
END
GO