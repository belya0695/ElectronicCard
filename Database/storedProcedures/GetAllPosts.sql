USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetAllPosts]    Script Date: 09.06.2018 19:11:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllPosts]
AS
BEGIN
SELECT *
FROM dbo.posts
END
GO