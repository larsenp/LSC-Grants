/****** Object:  Table [dbo].[LSC_WFTA_POST_PQV_APP]    Script Date: 05/05/2011 09:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_WFTA_POST_PQV_APP](
	[lsc_wfta_post_pqv_app_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[pa1_response] [varchar](max) NULL,
	[pa2_response] [varchar](max) NULL,
	[pa3_response] [varchar](max) NULL,
	[pa4_response] [varchar](max) NULL,
	[significant_accomplishments] [varchar](max) NULL,
	[systems_procedures] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_WFTA_POST_PQV_APP] PRIMARY KEY CLUSTERED 
(
	[lsc_wfta_post_pqv_app_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_WFTA_POST_PQV_APP',
		1,
		0,
		1)
