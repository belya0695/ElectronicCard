USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetDrugsListsByRecordId]    Script Date: 10.06.2018 13:04:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetDrugsListsByRecordId]
@record_id int
AS
BEGIN
SELECT *, dbo.drugs.drug_name
FROM dbo.drugs_lists INNER JOIN dbo.drugs ON dbo.drugs_lists.drug_id = dbo.drugs.drug_id
WHERE dbo.drugs_lists.record_id = @record_id
END
GO