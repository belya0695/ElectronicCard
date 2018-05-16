USE [EC.DB]
GO

/****** Object:  Table [dbo].[grugs_lists]    Script Date: 13.05.2018 20:47:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[grugs_lists](
	[record_id] [int] NOT NULL,
	[drug_id] [int] NOT NULL,
	[administration_mode] [nvarchar](300) NOT NULL,
	[treatment_duration] [int] NOT NULL,
 CONSTRAINT [PK_grugs_lists] PRIMARY KEY CLUSTERED 
(
	[record_id] ASC,
	[drug_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[grugs_lists]  WITH CHECK ADD  CONSTRAINT [FK_grugs_lists_drugs] FOREIGN KEY([drug_id])
REFERENCES [dbo].[drugs] ([drug_id])
GO

ALTER TABLE [dbo].[grugs_lists] CHECK CONSTRAINT [FK_grugs_lists_drugs]
GO

ALTER TABLE [dbo].[grugs_lists]  WITH CHECK ADD  CONSTRAINT [FK_grugs_lists_medical_records] FOREIGN KEY([record_id])
REFERENCES [dbo].[medical_records] ([record_id])
GO

ALTER TABLE [dbo].[grugs_lists] CHECK CONSTRAINT [FK_grugs_lists_medical_records]
GO