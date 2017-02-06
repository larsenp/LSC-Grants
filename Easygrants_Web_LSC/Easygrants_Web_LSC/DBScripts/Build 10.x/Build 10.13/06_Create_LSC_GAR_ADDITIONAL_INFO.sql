SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_GAR_ADDITIONAL_INFO](
	[lsc_gar_additional_info_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[adults_in_households] [int] NULL,
	[children_in_households] [int] NULL,
	[domestic_violence_cases] [int] NULL,
 CONSTRAINT [PK_LSC_GAR_ADDITIONAL_INFO] PRIMARY KEY CLUSTERED 
(
	[lsc_gar_additional_info_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT s_ID_GEN
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	VALUES
		('LSC_GAR_ADDITIONAL_INFO',
		1,
		0,
		1)