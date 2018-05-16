USE [EC.DB]
GO

/****** Object:  Table [dbo].[procedures_lists]    Script Date: 13.05.2018 20:48:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[procedures_lists](
	[record_id] [int] NOT NULL,
	[procedure_id] [int] NOT NULL,
	[administration_mode] [nvarchar](300) NOT NULL,
	[treatment_duration] [int] NOT NULL,
 CONSTRAINT [PK_procedures_lists] PRIMARY KEY CLUSTERED 
(
	[record_id] ASC,
	[procedure_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[procedures_lists]  WITH CHECK ADD  CONSTRAINT [FK_procedures_lists_medical_procedures] FOREIGN KEY([procedure_id])
REFERENCES [dbo].[medical_procedures] ([procedure_id])
GO

ALTER TABLE [dbo].[procedures_lists] CHECK CONSTRAINT [FK_procedures_lists_medical_procedures]
GO

ALTER TABLE [dbo].[procedures_lists]  WITH CHECK ADD  CONSTRAINT [FK_procedures_lists_medical_records] FOREIGN KEY([record_id])
REFERENCES [dbo].[medical_records] ([record_id])
GO

ALTER TABLE [dbo].[procedures_lists] CHECK CONSTRAINT [FK_procedures_lists_medical_records]
GO