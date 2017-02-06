/****** Object:  Table [dbo].[LSC_c_FUNDING_TERM]    Script Date: 05/14/2008 09:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_FUNDING_TERM](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_FUNDING_TERM] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_c_FUNDING_TERM
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(1,
		'1-year',
		'1-year',
		1)

INSERT LSC_c_FUNDING_TERM
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(2,
		'2-year',
		'2-year',
		2)

INSERT LSC_c_FUNDING_TERM
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(3,
		'3-year',
		'3-year',
		3)

INSERT LSC_c_FUNDING_TERM
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(4,
		'6-month',
		'6-month',
		4)

INSERT LSC_c_FUNDING_TERM
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(5,
		'4-month',
		'4-month',
		5)

INSERT LSC_c_FUNDING_TERM
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(6,
		'3-month',
		'3-month',
		6)

INSERT LSC_c_FUNDING_TERM
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(7,
		'2-month',
		'2-month',
		7)

INSERT LSC_c_FUNDING_TERM
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(8,
		'1-month',
		'1-month',
		8)

INSERT LSC_c_FUNDING_TERM
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(9,
		'month-to-month',
		'month-to-month',
		9)

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_c_FUNDING_TERM', 10, 1)
