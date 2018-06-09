USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[GetAllDrugs]    Script Date: 09.06.2018 19:10:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllDrugs]
AS
BEGIN
SELECT *
FROM dbo.drugs
END
GO