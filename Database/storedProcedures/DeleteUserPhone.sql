USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[DeleteUserPhone]    Script Date: 09.06.2018 23:15:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteUserPhone]
@phone_id int
AS
BEGIN
DELETE FROM [dbo].users_phones
      WHERE phone_id = @phone_id  
END
GO