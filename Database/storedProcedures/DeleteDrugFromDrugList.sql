USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[DeleteDrugFromDrugList]    Script Date: 09.06.2018 23:13:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteDrugFromDrugList]
@record_id int,
@drug_id int
AS
BEGIN
DELETE FROM [dbo].drugs_lists
      WHERE record_id = @record_id AND drug_id = @drug_id
END
GO