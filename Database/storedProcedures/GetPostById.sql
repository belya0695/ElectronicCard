USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetPostById]    Script Date: 11.06.2018 10:45:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPostById]
@post_id int
AS
BEGIN
SELECT *
FROM posts
WHERE posts.post_id = @post_id
END
GO