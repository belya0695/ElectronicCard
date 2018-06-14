USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[DeletePost]    Script Date: 09.06.2018 23:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeletePost]
@post_id int
AS
BEGIN
DELETE FROM [dbo].posts
      WHERE post_id = @post_id
END
GO