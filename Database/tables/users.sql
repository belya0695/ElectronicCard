USE [EC.DB]
GO

/****** Object:  Table [dbo].[users]    Script Date: 27.05.2018 18:28:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](40) NOT NULL,
	[middle_name] [nvarchar](40) NOT NULL,
	[last_name] [nvarchar](40) NOT NULL,
	[post_id] [int] NULL,
	[birthdate] [date] NOT NULL,
	[photo] [nvarchar](300) NULL,
	[workplace] [nvarchar](100) NULL,
	[email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_doctors] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_doctors_posts] FOREIGN KEY([post_id])
REFERENCES [dbo].[posts] ([post_id])
GO

ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_doctors_posts]
GO