/****** Object:  Table [dbo].[LSC_c_INTERNAL_OFFICE]    Script Date: 09/17/2012 13:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_INTERNAL_OFFICE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_INTERNAL_OFFICE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_c_INTERNAL_OFFICE
	(id,
	abbr,
	description,
	sort_order)
	VALUES(1,
		'OCE',
		'Office of Compliance and Enforcement',
		1)

INSERT LSC_c_INTERNAL_OFFICE
	(id,
	abbr,
	description,
	sort_order)
	VALUES(2,
		'OPP',
		'Office of Program Performance',
		2)

INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	VALUES('LSC_c_INTERNAL_OFFICE'
		,3
		,1
		,1)