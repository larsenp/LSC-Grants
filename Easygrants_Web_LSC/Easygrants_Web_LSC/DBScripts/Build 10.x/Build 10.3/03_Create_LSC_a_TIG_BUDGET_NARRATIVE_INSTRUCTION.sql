/****** Object:  Table [dbo].[LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION]    Script Date: 04/22/2011 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION](
	[id] [int] NOT NULL,
	[time_period_id] [int] NULL,
	[lsc_tig_budget_line_id] [int] NULL,
	[lsc_tig_budget_funding_type_id] [int] NULL,
	[instruction] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION',
		1,
		0,
		1)
     

