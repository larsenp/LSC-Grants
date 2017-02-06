/****** Object:  Table [dbo].[LSC_GRANTEE_PROJECT_SUBGRANT]    Script Date: 11/10/2010 10:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_GRANTEE_PROJECT_SUBGRANT](
	[lsc_grantee_project_subgrant_id] [int] NOT NULL,
	[grantee_project_id] [int] NULL,
	[subrecipient_organization_id] [int] NULL,
	[new_subrecipient_created] [bit] NOT NULL CONSTRAINT [DF_LSC_GRANTEE_PROJECT_SUBGRANT_new_subrecipient_created]  DEFAULT ((0)),
 CONSTRAINT [PK_LSC_GRANTEE_PROJECT_SUBGRANT] PRIMARY KEY CLUSTERED 
(
	[lsc_grantee_project_subgrant_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_GRANTEE_PROJECT_SUBGRANT',
		1,
		0,
		1)