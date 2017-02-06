CREATE TABLE [dbo].[LSC_c_PBIF_OPPORTUNITY](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_PBIF_OPPORTUNITY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT LSC_c_PBIF_OPPORTUNITY
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'Project'
		,'Project Grants'
		,1)

INSERT LSC_c_PBIF_OPPORTUNITY
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'Transformation'
		,'Transformation Grants'
		,2)

INSERT LSC_c_PBIF_OPPORTUNITY
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'Sustainability'
		,'Sustainability Grants'
		,3)

INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	VALUES
		('LSC_c_PBIF_OPPORTUNITY'
		,4
		,1
		,1)

