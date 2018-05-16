USE [EC.DB]
GO

/****** Object:  Table [dbo].[doctors_phones]    Script Date: 13.05.2018 20:46:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[doctors_phones](
	[phone_id] [int] IDENTITY(1,1) NOT NULL,
	[doctor_id] [int] NOT NULL,
	[phone_number] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_doctors_phones_1] PRIMARY KEY CLUSTERED 
(
	[phone_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[doctors_phones]  WITH CHECK ADD  CONSTRAINT [FK_doctors_phones_doctors] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[doctors] ([doctor_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[doctors_phones] CHECK CONSTRAINT [FK_doctors_phones_doctors]
GO