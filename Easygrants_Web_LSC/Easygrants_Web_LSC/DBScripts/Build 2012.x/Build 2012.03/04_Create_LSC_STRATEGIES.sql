SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_STRATEGIES](
	[lsc_strategies_id] [int] NOT NULL,
	[goal_id] [int] NULL,
	[strategy_type_id] [int] NULL,
	[strategy_description] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[desired_outcomes] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_LSC_STRATEGIES] PRIMARY KEY CLUSTERED 
(
	[lsc_strategies_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF



Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_STRATEGIES',
		1,
		0,
		1)