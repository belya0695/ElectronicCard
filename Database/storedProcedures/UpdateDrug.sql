USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDrug]    Script Date: 09.06.2018 22:27:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDrug]
@drug_id int,
@drug_name nvarchar(100)
AS
BEGIN
UPDATE [dbo].[drugs]
   SET [drug_name] = @drug_name
   WHERE drug_id = @drug_id
END
GO