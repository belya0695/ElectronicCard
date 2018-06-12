USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[AddLogin]    Script Date: 09.06.2018 21:20:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddLogin]
@login nvarchar(20),
@pass nvarchar(20),
@user_id int,
@role_id int
AS
BEGIN
INSERT INTO dbo.logins
VALUES(@login ,@pass, @user_id, @role_id)
END
GO