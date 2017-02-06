/****** Object:  Table [dbo].[LSC_c_PQV_RECOMMENDATION_STATUS]    Script Date: 05/23/2012 08:59:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_PQV_RECOMMENDATION_STATUS](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_PQV_RECOMMENDATION_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_c_PQV_RECOMMENDATION_STATUS
	(id,
	abbr,
	description,
	sort_order)
	VALUES(1,
		'implemented',
		'implemented',
		1)

INSERT LSC_c_PQV_RECOMMENDATION_STATUS
	(id,
	abbr,
	description,
	sort_order)
	VALUES(2,
		'being implemented',
		'being implemented',
		2)

INSERT LSC_c_PQV_RECOMMENDATION_STATUS
	(id,
	abbr,
	description,
	sort_order)
	VALUES(3,
		'implemented in part',
		'being implemented in part or with certain modifications',
		3)

INSERT LSC_c_PQV_RECOMMENDATION_STATUS
	(id,
	abbr,
	description,
	sort_order)
	VALUES(4,
		'being considered',
		'being considered',
		4)

INSERT LSC_c_PQV_RECOMMENDATION_STATUS
	(id,
	abbr,
	description,
	sort_order)
	VALUES(5,
		'not being implemented',
		'not being implemented',
		5)

INSERT s_ID_GEN
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	VALUES('LSC_c_PQV_RECOMMENDATION_STATUS',
		6,
		1,
		2)
