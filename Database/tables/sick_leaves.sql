USE [EC.DB]
GO

/****** Object:  Table [dbo].[sick_leaves]    Script Date: 13.05.2018 20:48:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sick_leaves](
	[sick_leave_id] [int] IDENTITY(1,1) NOT NULL,
	[issued] [bit] NOT NULL,
	[valid_from] [date] NULL,
	[valid_to] [date] NULL,
 CONSTRAINT [PK_seak_leaves] PRIMARY KEY CLUSTERED 
(
	[sick_leave_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO