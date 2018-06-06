USE [EC.DB]
GO

/****** Object:  Table [dbo].[medical_records]    Script Date: 27.05.2018 17:32:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[medical_records](
	[record_id] [int] IDENTITY(1,1) NOT NULL,
	[record_date] [date] NOT NULL,
	[patient_id] [int] NOT NULL,
	[diagnosis_id] [int] NOT NULL,
	[doctor_id] [int] NOT NULL,
	[sick_leave_id] [int] NOT NULL,
 CONSTRAINT [PK_medical_records] PRIMARY KEY CLUSTERED 
(
	[record_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[medical_records]  WITH CHECK ADD  CONSTRAINT [FK_medical_records_diagnoses] FOREIGN KEY([diagnosis_id])
REFERENCES [dbo].[diagnoses] ([diagnosis_id])
GO

ALTER TABLE [dbo].[medical_records] CHECK CONSTRAINT [FK_medical_records_diagnoses]
GO

ALTER TABLE [dbo].[medical_records]  WITH CHECK ADD  CONSTRAINT [FK_medical_records_sick_leaves] FOREIGN KEY([sick_leave_id])
REFERENCES [dbo].[sick_leaves] ([sick_leave_id])
GO

ALTER TABLE [dbo].[medical_records] CHECK CONSTRAINT [FK_medical_records_sick_leaves]
GO

ALTER TABLE [dbo].[medical_records]  WITH CHECK ADD  CONSTRAINT [FK_medical_records_users] FOREIGN KEY([patient_id])
REFERENCES [dbo].[users] ([user_id])
GO

ALTER TABLE [dbo].[medical_records] CHECK CONSTRAINT [FK_medical_records_users]
GO

ALTER TABLE [dbo].[medical_records]  WITH CHECK ADD  CONSTRAINT [FK_medical_records_users1] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[users] ([user_id])
GO

ALTER TABLE [dbo].[medical_records] CHECK CONSTRAINT [FK_medical_records_users1]
GO