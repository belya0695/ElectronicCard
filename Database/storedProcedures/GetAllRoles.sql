USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetAllRoles]    Script Date: 09.06.2018 19:11:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllRoles]
AS
BEGIN
SELECT *
FROM dbo.roles
END
GO