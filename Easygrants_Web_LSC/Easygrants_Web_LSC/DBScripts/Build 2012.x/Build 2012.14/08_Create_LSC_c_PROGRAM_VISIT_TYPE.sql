/****** Object:  Table [dbo].[LSC_c_PROGRAM_VISIT_TYPE]    Script Date: 09/17/2012 13:45:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_PROGRAM_VISIT_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_PROGRAM_VISIT_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_c_PROGRAM_VISIT_TYPE
	(id,
	abbr,
	description)
	VALUES(1,
		'CAV',
		'Capability Assessment Visit')

INSERT LSC_c_PROGRAM_VISIT_TYPE
	(id,
	abbr,
	description)
	VALUES(2,
		'Follow-up',
		'Follow-up Review')

INSERT LSC_c_PROGRAM_VISIT_TYPE
	(id,
	abbr,
	description)
	VALUES(3,
		'Joint Visit',
		'Joint Investigative Visit')

INSERT LSC_c_PROGRAM_VISIT_TYPE
	(id,
	abbr,
	description)
	VALUES(4,
		'PR',
		'Post Reconfiguration')

INSERT LSC_c_PROGRAM_VISIT_TYPE
	(id,
	abbr,
	description)
	VALUES(5,
		'PEV',
		'Program Engagement')

INSERT LSC_c_PROGRAM_VISIT_TYPE
	(id,
	abbr,
	description)
	VALUES(6,
		'PQV',
		'Program Quality')

INSERT LSC_c_PROGRAM_VISIT_TYPE
	(id,
	abbr,
	description)
	VALUES(7,
		'Technical Assistance',
		'Technical Assistance')


INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	VALUES('LSC_c_PROGRAM_VISIT_TYPE'
		,8
		,1
		,1)

