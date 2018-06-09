USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[DeleteLogin]    Script Date: 09.06.2018 23:13:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteLogin]
@login nvarchar(20)
AS
BEGIN
DELETE FROM [dbo].logins
      WHERE login = @login
END
GO