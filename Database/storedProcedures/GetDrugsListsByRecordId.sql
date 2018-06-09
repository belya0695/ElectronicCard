USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetDrugsListsByRecordId]    Script Date: 09.06.2018 19:36:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetDrugsListsByRecordId]
@record_id int
AS
BEGIN
SELECT *
FROM dbo.drugs_lists
WHERE dbo.drugs_lists.record_id = @record_id
END
GO