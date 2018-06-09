USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[DeleteUserAndHisPhones]    Script Date: 09.06.2018 23:14:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteUserAndHisPhones]
@user_id int
AS
BEGIN
DELETE FROM [dbo].users
      WHERE user_id = @user_id
DELETE FROM [dbo].users_phones
      WHERE user_id = @user_id
END
GO