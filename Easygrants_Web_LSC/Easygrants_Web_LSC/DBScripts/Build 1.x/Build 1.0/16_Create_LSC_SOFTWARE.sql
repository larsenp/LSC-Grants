USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_SOFTWARE]    Script Date: 01/25/2008 15:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_SOFTWARE](
	[lsc_software_id] [int] NOT NULL,
	[lsc_software_product_id] [int] NULL,
	[grantee_project_id] [int] NULL,
	[in_use] [bit] NOT NULL CONSTRAINT [DF_LSC_SOFTWARE_in_use]  DEFAULT ((0)),
	[version] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[percent_staff] [int] NULL,
 CONSTRAINT [PK_LSC_SOFTWARE] PRIMARY KEY CLUSTERED 
(
	[lsc_software_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_SOFTWARE', 1, 0)