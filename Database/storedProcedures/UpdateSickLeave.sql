USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[UpdateSickLeave]    Script Date: 09.06.2018 22:28:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateSickLeave]
@leave_id int,
@issued bit,
@from date, 
@to date
AS
BEGIN
UPDATE [dbo].sick_leaves
   SET issued = @issued,
   valid_from = @from,
   valid_to = @to
   WHERE sick_leave_id = @leave_id
END
GO