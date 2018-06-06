USE [EC.DB]
GO

/****** Object:  Table [dbo].[drugs]    Script Date: 13.05.2018 20:47:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[drugs](
	[drug_id] [int] IDENTITY(1,1) NOT NULL,
	[drug_name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_drugs] PRIMARY KEY CLUSTERED 
(
	[drug_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO