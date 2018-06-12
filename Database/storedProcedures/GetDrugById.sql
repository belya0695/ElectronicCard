USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetDrugById]    Script Date: 11.06.2018 10:44:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetDrugById]
@drug_id int
AS
BEGIN
SELECT *
FROM drugs
WHERE drugs.drug_id = @drug_id
END
GO