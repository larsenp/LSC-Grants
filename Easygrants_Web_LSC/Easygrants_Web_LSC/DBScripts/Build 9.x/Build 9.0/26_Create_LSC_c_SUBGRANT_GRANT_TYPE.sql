/****** Object:  Table [dbo].[LSC_c_SUBGRANT_GRANT_TYPE]    Script Date: 10/13/2010 17:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_SUBGRANT_GRANT_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_SUBGRANT_GRANT_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


INSERT [LSC_c_SUBGRANT_GRANT_TYPE]
	([id] ,
	[abbr],
	[description],
	[sort_order])
	VALUES(1,
		'Basic Field',
		'Basic Field',
		1)

INSERT [LSC_c_SUBGRANT_GRANT_TYPE]
	([id] ,
	[abbr],
	[description],
	[sort_order])
	VALUES(2,
		'Migrant Worker',
		'Migrant Worker',
		2)

INSERT [LSC_c_SUBGRANT_GRANT_TYPE]
	([id] ,
	[abbr],
	[description],
	[sort_order])
	VALUES(3,
		'Native American',
		'Native American',
		3)

INSERT [LSC_c_SUBGRANT_GRANT_TYPE]
	([id] ,
	[abbr],
	[description],
	[sort_order])
	VALUES(4,
		'TIG',
		'TIG',
		4)

INSERT s_ID_GEN
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	VALUES('LSC_c_SUBGRANT_GRANT_TYPE',
		5,
		1,
		2)

