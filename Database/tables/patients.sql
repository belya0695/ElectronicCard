USE [EC.DB]
GO

/****** Object:  Table [dbo].[patients]    Script Date: 13.05.2018 20:47:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[patients](
	[patient_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](20) NOT NULL,
	[middle_name] [nvarchar](30) NOT NULL,
	[last_name] [nvarchar](30) NOT NULL,
	[birthdate] [date] NOT NULL,
	[workplace] [nvarchar](100) NULL,
 CONSTRAINT [PK_patients] PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO