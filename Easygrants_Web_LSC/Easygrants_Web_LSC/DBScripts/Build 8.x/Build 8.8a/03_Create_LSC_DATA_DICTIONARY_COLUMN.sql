/****** Object:  Table [dbo].[LSC_DATA_DICTIONARY_COLUMN]    Script Date: 07/01/2010 16:17:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_DATA_DICTIONARY_COLUMN](
	[lsc_data_dictionary_column_id] [int] NOT NULL,
	[object_id] [int] NULL,
	[column_id] [int] NULL,
	[data_object_property_key] [varchar](100) NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_DATA_DICTIONARY_COLUMN] PRIMARY KEY CLUSTERED 
(
	[lsc_data_dictionary_column_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_DATA_DICTIONARY_COLUMN',
		1,
		0,
		1)
