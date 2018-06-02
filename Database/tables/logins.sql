USE [EC.DB]
GO

/****** Object:  Table [dbo].[logins]    Script Date: 27.05.2018 17:31:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[logins](
	[login] [nvarchar](20) NOT NULL,
	[pass] [nvarchar](20) NOT NULL,
	[user_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_logins] PRIMARY KEY CLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[logins]  WITH CHECK ADD  CONSTRAINT [FK_logins_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([role_id])
GO

ALTER TABLE [dbo].[logins] CHECK CONSTRAINT [FK_logins_roles]
GO

ALTER TABLE [dbo].[logins]  WITH CHECK ADD  CONSTRAINT [FK_logins_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[logins] CHECK CONSTRAINT [FK_logins_users]
GO