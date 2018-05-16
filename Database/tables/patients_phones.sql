USE [EC.DB]
GO

/****** Object:  Table [dbo].[patients_phones]    Script Date: 13.05.2018 20:48:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[patients_phones](
	[phone_id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NOT NULL,
	[phone_number] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_patients_phones_1] PRIMARY KEY CLUSTERED 
(
	[phone_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[patients_phones]  WITH CHECK ADD  CONSTRAINT [FK_patients_phones_patients] FOREIGN KEY([patient_id])
REFERENCES [dbo].[patients] ([patient_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[patients_phones] CHECK CONSTRAINT [FK_patients_phones_patients]
GO