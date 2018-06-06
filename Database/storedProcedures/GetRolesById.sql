USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetRolesById]    Script Date: 06.06.2018 18:52:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetRolesById]
@user_id int
AS
BEGIN
SELECT dbo.roles.role_id, dbo.roles.role_name
FROM dbo.roles INNER JOIN dbo.logins ON dbo.roles.role_id = dbo.logins.role_id
WHERE dbo.logins.user_id = @user_id
END
GO