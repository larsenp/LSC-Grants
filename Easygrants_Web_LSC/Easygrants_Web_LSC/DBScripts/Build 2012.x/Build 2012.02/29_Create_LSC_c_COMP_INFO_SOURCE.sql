CREATE TABLE [dbo].[LSC_c_COMP_INFO_SOURCE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_COMP_INFO_SOURCE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT [LSC_c_COMP_INFO_SOURCE](
	[id] ,
	[abbr] ,
	[description] ,
	[sort_order] )
	VALUES(1,
		'Newspaper',
		'Newspaper Advertisement',
		1)

INSERT [LSC_c_COMP_INFO_SOURCE](
	[id] ,
	[abbr] ,
	[description] ,
	[sort_order] )
	VALUES(2,
		'Bar Association',
		'Bar association announcement/ Bar journal notice',
		2)
 
INSERT [LSC_c_COMP_INFO_SOURCE](
	[id] ,
	[abbr] ,
	[description] ,
	[sort_order] )
	VALUES(3,
		'Federal Register',
		'Federal Register notice',
		3)

INSERT [LSC_c_COMP_INFO_SOURCE](
	[id] ,
	[abbr] ,
	[description] ,
	[sort_order] )
	VALUES(4,
		'LSC Email Notice',
		'LSC Email Notice',
		4)

INSERT [LSC_c_COMP_INFO_SOURCE](
	[id] ,
	[abbr] ,
	[description] ,
	[sort_order] )
	VALUES(5,
		'Internet search',
		'Internet search',
		5)

INSERT [LSC_c_COMP_INFO_SOURCE](
	[id] ,
	[abbr] ,
	[description] ,
	[sort_order] )
	VALUES(6,
		'Other',
		'Other',
		6)

Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_c_COMP_INFO_SOURCE',
		7,
		1,
		2)

