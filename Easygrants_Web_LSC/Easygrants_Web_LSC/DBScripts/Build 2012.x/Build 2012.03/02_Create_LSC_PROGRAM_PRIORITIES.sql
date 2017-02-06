SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_PROGRAM_PRIORITIES](
	[lsc_program_priorities_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[priority_description] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_LSC_PROGRAM_PRIORITIES] PRIMARY KEY CLUSTERED 
(
	[lsc_program_priorities_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_PROGRAM_PRIORITIES',
		1,
		0,
		1)