USE [EC.DB]
GO

/****** Object:  StoredProcedure [dbo].[UpdateUserPhone]    Script Date: 09.06.2018 22:29:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateUserPhone]
@phone_id int,
@phone nvarchar(20)

AS
BEGIN
UPDATE [dbo].users_phones
   SET phone_number = @phone
   WHERE phone_id = @phone_id
END
GO