/****** Object:  Table [dbo].[LSC_c_GRANT_CONDITION_TYPE]    Script Date: 05/27/2008 14:50:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_GRANT_CONDITION_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_GRANT_CONDITION_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_c_GRANT_CONDITION_TYPE
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(1,
		'MIG',
		'MIG - Migrant Issues',
		1)

INSERT LSC_c_GRANT_CONDITION_TYPE
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(2,
		'NEX',
		'NEX  - Individualized New',
		2)

INSERT LSC_c_GRANT_CONDITION_TYPE
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(3,
		'BD',
		'BD - Board Composition',
		3)

INSERT LSC_c_GRANT_CONDITION_TYPE
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(4,
		'NE',
		'NE - New Entity',
		4)

INSERT LSC_c_GRANT_CONDITION_TYPE
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(5,
		'ISS',
		'ISS - Individualized Program',
		5)

INSERT LSC_c_GRANT_CONDITION_TYPE
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(6,
		'CA',
		'CA - Capability Assessment',
		6)

INSERT LSC_c_GRANT_CONDITION_TYPE
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(7,
		'PI',
		'PI - Performance Issues',
		7)

INSERT LSC_c_GRANT_CONDITION_TYPE
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(8,
		'LOGO',
		'LOGO - Use of LSC Logo',
		8)

INSERT LSC_c_GRANT_CONDITION_TYPE
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(9,
		'MER',
		'MER - Merger Issue',
		9)

INSERT LSC_c_GRANT_CONDITION_TYPE
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(10,
		'SUB',
		'SUB - Subgrant Issue',
		10)


insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_c_GRANT_CONDITION_TYPE', 11, 1)