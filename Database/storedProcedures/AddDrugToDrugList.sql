USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[AddDrugToDrugList]    Script Date: 09.06.2018 21:20:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddDrugToDrugList]
@record_id int,
@drug_id int,
@mode nvarchar(300),
@duration int
AS
BEGIN
INSERT INTO dbo.drugs_lists
VALUES(@record_id, @drug_id, @mode, @duration)
END
GO