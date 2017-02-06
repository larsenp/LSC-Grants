SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_WFTA_SUBGRANT_MONITORING_PROCEDURE](
	[lsc_wfta_subgrant_monitoring_procedure_id] [int] NOT NULL,
	[wf_task_assignment_id] [nchar](10) NULL,
	[lsc_subgrant_monitoring_procedure_id] [int] NULL,
 CONSTRAINT [PK_LSC_WFTA_SUBGRANT_MONITORING_PROCEDURE] PRIMARY KEY CLUSTERED 
(
	[lsc_wfta_subgrant_monitoring_procedure_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_WFTA_SUBGRANT_MONITORING_PROCEDURE',
		1,
		0,
		1)