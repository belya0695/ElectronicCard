USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[DeleteDrug]    Script Date: 09.06.2018 23:13:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteDrug]
@drug_id int
AS
BEGIN
DELETE FROM [dbo].drugs
      WHERE drug_id = @drug_id
END
GO