/****** Object:  Table [dbo].[LSC_c_PAI_CASE_HANDLER_TYPE]    Script Date: 01/07/2016 11:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_PAI_CASE_HANDLER_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_PAI_CASE_HANDLER_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_c_PAI_CASE_HANDLER_TYPE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'PA'
		,'Private Attorney'
		,1)

INSERT LSC_c_PAI_CASE_HANDLER_TYPE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'LS'
		,'Law Graduate/Law Student'
		,2)

INSERT LSC_c_PAI_CASE_HANDLER_TYPE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'PL'
		,'Paralegal/Other Licensed Professional'
		,3)

INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	VALUES
		('LSC_c_PAI_CASE_HANDLER_TYPE'
		,4
		,1
		,2)

