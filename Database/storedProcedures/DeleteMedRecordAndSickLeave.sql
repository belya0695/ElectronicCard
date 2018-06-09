USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[DeleteMedRecordAndSickLeave]    Script Date: 09.06.2018 23:14:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteMedRecordAndSickLeave]
@record_id int
AS
BEGIN
DECLARE @leave_id int
SELECT @leave_id  =  sick_leave_id FROM [dbo].medical_records WHERE record_id = @record_id
DELETE FROM [dbo].medical_records
      WHERE record_id = @record_id
DELETE FROM dbo.sick_leaves
	  WHERE sick_leave_id = @leave_id
END
GO