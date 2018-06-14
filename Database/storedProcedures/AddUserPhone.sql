USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[AddUserPhone]    Script Date: 09.06.2018 21:21:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddUserPhone]
@user_id int,
@phone nvarchar(20)
AS
BEGIN
INSERT INTO dbo.users_phones
VALUES(@user_id, @phone)
END
GO