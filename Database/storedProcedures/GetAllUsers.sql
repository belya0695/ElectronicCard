USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 11.06.2018 21:50:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllUsers]
AS
BEGIN
SELECT *, posts.post_name, logins.login
FROM dbo.users INNER JOIN posts ON dbo.users.post_id = posts.post_id INNER JOIN logins ON users.user_id = logins.user_id
END
GO