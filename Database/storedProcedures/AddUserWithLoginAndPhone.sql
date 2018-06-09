USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[AddUserWithLoginAndPhone]    Script Date: 09.06.2018 21:21:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddUserWithLoginAndPhone]
@first_name nvarchar(40),
@middle_name nvarchar(40),
@last_name nvarchar(40),
@post_id int,
@birthdate date,
@workplace nvarchar(100),
@email nvarchar(100),
@phone nvarchar(20),
@login nvarchar(20),
@pass nvarchar(20),
@role_id int
AS
BEGIN
INSERT INTO dbo.users
VALUES(@first_name, @middle_name, @last_name, @post_id, @birthdate, @workplace, @email)
DECLARE @user_id int = @@IDENTITY

INSERT INTO dbo.users_phones
VALUES(@user_id, @phone)

INSERT INTO dbo.logins
VALUES(@login, @pass, @user_id, @role_id)
END
GO