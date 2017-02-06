SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_SUBGRANT_CONTRACT_TYPE](
	[lsc_subgrant_contract_id] [int] NULL,
	[wf_task_assignment_id] [int] NULL,
	[lsc_subgrant_contract_type_id] [int] NULL
) ON [PRIMARY]




insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_SUBGRANT_CONTRACT_TYPE',
		1,
		0,
		1)