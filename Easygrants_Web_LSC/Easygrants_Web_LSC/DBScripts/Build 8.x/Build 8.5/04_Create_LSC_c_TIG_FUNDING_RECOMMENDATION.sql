/****** Object:  Table [dbo].[LSC_c_TIG_GRANT_CLASSIFICATION]    Script Date: 05/17/2010 10:24:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_TIG_FUNDING_RECOMMENDATION](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_TIG_FUNDING_RECOMMENDATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, 
	IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_c_TIG_FUNDING_RECOMMENDATION
	(id,
	abbr,
	description,
	sort_order)
	VALUES(1,
		'Recommend',
		'Recommend for Funding',
		1)

INSERT LSC_c_TIG_FUNDING_RECOMMENDATION
	(id,
	abbr,
	description,
	sort_order)
	VALUES(2,
		'Do Not Recommend',
		'Do Not Recommend for Funding',
		2)

insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_c_TIG_FUNDING_RECOMMENDATION',
		3,
		1,
		2)

