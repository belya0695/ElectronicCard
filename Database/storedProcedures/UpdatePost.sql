USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[UpdatePost]    Script Date: 09.06.2018 22:28:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdatePost]
@post_id int,
@post_name nvarchar(100)
AS
BEGIN
UPDATE [dbo].posts
   SET post_name = @post_name
   WHERE post_id = @post_id
END
GO