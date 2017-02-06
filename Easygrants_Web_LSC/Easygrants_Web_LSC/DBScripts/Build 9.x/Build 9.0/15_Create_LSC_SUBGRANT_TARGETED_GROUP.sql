/****** Object:  Table [dbo].[LSC_SUBGRANT_TARGETED_GROUP]    Script Date: 08/31/2010 10:21:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_SUBGRANT_TARGETED_GROUP](
	[lsc_subgrant_targeted_group_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[lsc_subgrant_target_group_id] [int] NULL,
 CONSTRAINT [PK_LSC_SUBGRANT_TARGETED_GROUP] PRIMARY KEY CLUSTERED 
(
	[lsc_subgrant_targeted_group_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT s_ID_GEN
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	VALUES('LSC_SUBGRANT_TARGETED_GROUP',
		1,
		0,
		1)