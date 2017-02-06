/****** Object:  Table [dbo].[LSC_c_SUBGRANT_TARGET_GROUP]    Script Date: 08/31/2010 09:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_SUBGRANT_TARGET_GROUP](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_SUBGRANT_TARGET_GROUP] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_c_SUBGRANT_TARGET_GROUP (id, abbr, description, sort_order) VALUES(1, 'A', 'General Public', 1)
INSERT LSC_c_SUBGRANT_TARGET_GROUP (id, abbr, description, sort_order) VALUES(2, 'B', 'Migrants', 2)
INSERT LSC_c_SUBGRANT_TARGET_GROUP (id, abbr, description, sort_order) VALUES(3, 'C', 'Farmworkers', 3)
INSERT LSC_c_SUBGRANT_TARGET_GROUP (id, abbr, description, sort_order) VALUES(4, 'D', 'Tenants', 4)
INSERT LSC_c_SUBGRANT_TARGET_GROUP (id, abbr, description, sort_order) VALUES(5, 'E', 'Children', 5)
INSERT LSC_c_SUBGRANT_TARGET_GROUP (id, abbr, description, sort_order) VALUES(6, 'F', 'Senior Citizens', 6)
INSERT LSC_c_SUBGRANT_TARGET_GROUP (id, abbr, description, sort_order) VALUES(7, 'G', 'Handicapped', 7)
INSERT LSC_c_SUBGRANT_TARGET_GROUP (id, abbr, description, sort_order) VALUES(8, 'H', 'Domestic Violence', 8)
INSERT LSC_c_SUBGRANT_TARGET_GROUP (id, abbr, description, sort_order) VALUES(9, 'I', 'Native Americans', 9)
INSERT LSC_c_SUBGRANT_TARGET_GROUP (id, abbr, description, sort_order) VALUES(10, 'J', 'African Americans', 10)
INSERT LSC_c_SUBGRANT_TARGET_GROUP (id, abbr, description, sort_order) VALUES(11, 'K', 'Hispanics', 11)
INSERT LSC_c_SUBGRANT_TARGET_GROUP (id, abbr, description, sort_order) VALUES(12, 'L', 'Asians', 12)
INSERT LSC_c_SUBGRANT_TARGET_GROUP (id, abbr, description, sort_order) VALUES(13, 'M', 'Recipient''s Priorities', 13)
INSERT LSC_c_SUBGRANT_TARGET_GROUP (id, abbr, description, sort_order) VALUES(14, 'N', 'Other', 14)

insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_c_SUBGRANT_TARGET_GROUP',
		15,
		1,
		2)