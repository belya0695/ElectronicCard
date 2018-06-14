USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetUserByLogin]    Script Date: 12.06.2018 16:01:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUserByLogin]
@user_login nvarchar(40)
AS
BEGIN
SELECT dbo.users.user_id, dbo.users.first_name, dbo.users.middle_name, dbo.users.last_name, dbo.users.post_id, dbo.users.birthdate, 
dbo.users.workplace, dbo.users.email, dbo.posts.post_id, dbo.posts.post_name, dbo.logins.login, dbo.logins.pass, dbo.roles.role_name
FROM dbo.users INNER JOIN
     dbo.users_phones ON dbo.users.user_id = dbo.users_phones.user_id LEFT JOIN
     dbo.posts ON dbo.users.post_id = dbo.posts.post_id INNER JOIN
     dbo.logins ON dbo.users.user_id = dbo.logins.user_id INNER JOIN
     dbo.roles ON dbo.logins.role_id = dbo.roles.role_id
WHERE dbo.logins.login = @user_login
GROUP BY dbo.users.user_id, dbo.users.first_name, dbo.users.middle_name, dbo.users.last_name, dbo.users.post_id, dbo.users.birthdate, 
dbo.users.workplace, dbo.users.email, dbo.posts.post_id, dbo.posts.post_name, dbo.logins.login, dbo.logins.pass, dbo.roles.role_name
END
GO
