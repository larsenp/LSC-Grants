/****** Object:  Table [dbo].[LSC_TIG_CONTRACT]    Script Date: 04/22/2011 16:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_TIG_CONTRACT](
	[lsc_tig_contract_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[contracting_entity] [varchar](200) NULL,
	[tig_contract_entity_type_id] [int] NULL,
	[contract_amount_tig] [int] NULL,
	[contract_amount_other] [int] NULL,
	[contractor_staff_name_first] [varchar](50) NULL,
	[contractor_staff_name_last] [varchar](50) NULL,
	[project_role] [varchar](100) NULL,
	[tig_funded_tasks] [varchar](1000) NULL,
	[legal_content_activities] [bit] NULL,
	[legal_decision_activities] [bit] NULL,
 CONSTRAINT [PK_LSC_TIG_CONTRACT] PRIMARY KEY CLUSTERED 
(
	[lsc_tig_contract_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_TIG_CONTRACT',
		1,
		0,
		1)