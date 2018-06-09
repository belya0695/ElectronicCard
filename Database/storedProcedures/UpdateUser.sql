USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 09.06.2018 22:29:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateUser]
@user_id int,
@first_name nvarchar(40),
@middle_name nvarchar(40),
@last_name nvarchar(40),
@post_id int,
@birthdate date,
@workplace nvarchar(100),
@email nvarchar(100)
AS
BEGIN
UPDATE [dbo].users
   SET first_name = @first_name,
   middle_name = @middle_name,
   last_name = @last_name,
   post_id = @post_id,
   birthdate = @birthdate,
   workplace = @workplace,
   email = @email
   WHERE user_id = @user_id
END
GO