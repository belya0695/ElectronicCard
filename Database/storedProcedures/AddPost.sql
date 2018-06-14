USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[AddPost]    Script Date: 09.06.2018 21:21:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddPost]
@post_name nvarchar(100)
AS
BEGIN
INSERT INTO dbo.posts
VALUES(@post_name)
END
GO