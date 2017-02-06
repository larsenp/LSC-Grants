/****** Object:  Table [dbo].[LSC_SUBGRANT_SERV_BY_TYPE]    Script Date: 08/31/2010 10:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_SUBGRANT_SERV_BY_TYPE](
	[lsc_subgrant_serv_by_type_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[lsc_subgrant_serv_type_id] [int] NULL,
 CONSTRAINT [PK_LSC_SUBGRANT_SERV_BY_TYPE] PRIMARY KEY CLUSTERED 
(
	[lsc_subgrant_serv_by_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT s_ID_GEN
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	VALUES('LSC_SUBGRANT_SERV_BY_TYPE',
		1,
		0,
		1)
