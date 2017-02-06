SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_FUND_BALANCE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_FUND_BALANCE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_c_FUND_BALANCE',
		1,
		1,
		2)