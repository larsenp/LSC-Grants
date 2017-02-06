SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_TIG_BUDGET_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_TIG_BUDGET_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_c_TIG_BUDGET_TYPE
	([id] ,
	[abbr],
	[description],
	[sort_order])
	VALUES(1,
		'Prospective',
		'Prospective',
		1)

INSERT LSC_c_TIG_BUDGET_TYPE
	([id] ,
	[abbr],
	[description],
	[sort_order])
	VALUES(2,
		'Final',
		'Final',
		2)

INSERT s_ID_GEN
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	VALUES
		('LSC_c_TIG_BUDGET_TYPE',
		3,
		1,
		2)

