CREATE TABLE [dbo].LSC_c_BOARD_INFO_SOURCE(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_BOARD_INFO_SOURCE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT LSC_c_BOARD_INFO_SOURCE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'Application'
		,'Competitive or Renewal Application'
		,1)

INSERT LSC_c_BOARD_INFO_SOURCE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'NIC'
		,'Notice of Intent to Compete'
		,2)

INSERT LSC_c_BOARD_INFO_SOURCE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'1607'
		,'1607 Reporting'
		,3)

INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	VALUES
		('LSC_c_BOARD_INFO_SOURCE'
		,4
		,1
		,2)

