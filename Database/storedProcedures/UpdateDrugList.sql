USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDrugList]    Script Date: 09.06.2018 22:28:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDrugList]
@record_id int,
@drug_id int,
@mode nvarchar(300), 
@duration int 
AS
BEGIN
UPDATE [dbo].drugs_lists
   SET administration_mode = @mode,
   treatment_duration = @duration
   WHERE record_id = @record_id AND drug_id = @drug_id
END
GO