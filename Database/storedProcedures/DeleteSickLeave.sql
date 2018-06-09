USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[DeleteSickLeave]    Script Date: 09.06.2018 23:14:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteSickLeave]
@leave_id int
AS
BEGIN
DELETE FROM [dbo].sick_leaves
      WHERE sick_leave_id = @leave_id
END
GO