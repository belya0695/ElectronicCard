USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetUserPhonesByUserId]    Script Date: 09.06.2018 19:12:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUserPhonesByUserId]
@userId int
AS
BEGIN
SELECT *
FROM dbo.users_phones
WHERE dbo.users_phones.user_id = @userId
END
GO