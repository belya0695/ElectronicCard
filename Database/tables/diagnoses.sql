USE [EC.DB]
GO

/****** Object:  Table [dbo].[diagnoses]    Script Date: 13.05.2018 20:44:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[diagnoses](
	[diagnosis_id] [int] IDENTITY(1,1) NOT NULL,
	[diagnosis_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_diagnosis] PRIMARY KEY CLUSTERED 
(
	[diagnosis_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO