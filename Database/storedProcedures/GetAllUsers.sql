USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 10.06.2018 22:39:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllUsers]
AS
BEGIN
SELECT *, posts.post_name
FROM dbo.users INNER JOIN posts ON dbo.users.post_id = posts.post_id
END
GO