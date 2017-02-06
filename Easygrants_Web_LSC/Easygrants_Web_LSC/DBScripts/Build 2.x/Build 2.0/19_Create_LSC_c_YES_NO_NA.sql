/****** Object:  Table [dbo].[LSC_c_YES_NO_NA]    Script Date: 05/21/2008 10:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_YES_NO_NA](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_YES_NO_NA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_c_YES_NO_NA
	(id, abbr, description, sort_order)
	VALUES
		(1, 'Yes', 'Yes', 1)

INSERT LSC_c_YES_NO_NA
	(id, abbr, description, sort_order)
	VALUES
		(2, 'No', 'No', 2)

INSERT LSC_c_YES_NO_NA
	(id, abbr, description, sort_order)
	VALUES
		(3, 'N/A', 'N/A', 3)


insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_c_YES_NO_NA', 1, 1)