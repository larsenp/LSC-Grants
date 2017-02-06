/****** Object:  Table [dbo].[LSC_DATA_DICTIONARY_OBJECT]    Script Date: 10/21/2010 10:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_DATA_DICTIONARY_OBJECT](
	[lsc_data_dictionary_object_id] [int] NOT NULL,
	[object_id] [int] NULL,
	[data_object_definition_key] [varchar](100) NULL,
	[description] [varchar](max) NULL,
	[is_baseline] [bit] NULL,
 CONSTRAINT [PK_LSC_DATA_DICTIONARY_OBJECT] PRIMARY KEY CLUSTERED 
(
	[lsc_data_dictionary_object_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_DATA_DICTIONARY_OBJECT',
		1,
		0,
		1)