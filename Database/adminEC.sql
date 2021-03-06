USE [master]
GO
CREATE LOGIN [adminEC] WITH PASSWORD=N'1111', DEFAULT_DATABASE=[EC.DB], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [adminEC]
GO
USE [EC.DB]
GO
CREATE USER [adminEC] FOR LOGIN [adminEC]
GO
USE [EC.DB]
GO
ALTER ROLE [db_owner] ADD MEMBER [adminEC]
GO
