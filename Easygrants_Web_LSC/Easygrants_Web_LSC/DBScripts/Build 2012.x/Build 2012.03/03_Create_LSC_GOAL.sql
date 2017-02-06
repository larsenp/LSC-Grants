SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_GOAL](
	[lsc_goal_id] [int] NOT NULL,
	[program_priorities_id] [int] NULL,
	[goal_description] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[legal_problem_type_id] [int] NULL,
 CONSTRAINT [PK_LSC_GOAL] PRIMARY KEY CLUSTERED 
(
	[lsc_goal_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_GOAL',
		1,
		0,
		1)