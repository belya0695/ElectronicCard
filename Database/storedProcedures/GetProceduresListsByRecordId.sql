USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetProceduresListsByRecordId]    Script Date: 09.06.2018 19:35:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetProceduresListsByRecordId]
@record_id int
AS
BEGIN
SELECT *
FROM dbo.procedures_lists
WHERE dbo.procedures_lists.record_id = @record_id
END
GO