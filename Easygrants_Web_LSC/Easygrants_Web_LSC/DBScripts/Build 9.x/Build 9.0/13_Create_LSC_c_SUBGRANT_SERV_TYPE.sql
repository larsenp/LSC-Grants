/****** Object:  Table [dbo].[LSC_c_SUBGRANT_SERV_TYPE]    Script Date: 08/31/2010 09:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_SUBGRANT_SERV_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_SUBGRANT_SERV_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT  LSC_c_SUBGRANT_SERV_TYPE (id, abbr, description, sort_order) VALUES(1, 'Library development', 'Library/resource material - development', 1)
INSERT  LSC_c_SUBGRANT_SERV_TYPE (id, abbr, description, sort_order) VALUES(2, 'Library maintenance', 'Library/resource material - maintenance', 2)
INSERT  LSC_c_SUBGRANT_SERV_TYPE (id, abbr, description, sort_order) VALUES(3, 'Resource distr.', 'Resource material - distribution', 3)
INSERT  LSC_c_SUBGRANT_SERV_TYPE (id, abbr, description, sort_order) VALUES(4, 'Facilitation', 'Facilitate cooperation among legal services organizations', 4)
INSERT  LSC_c_SUBGRANT_SERV_TYPE (id, abbr, description, sort_order) VALUES(5, 'Public relations', 'Public relations', 5)
INSERT  LSC_c_SUBGRANT_SERV_TYPE (id, abbr, description, sort_order) VALUES(6, 'Technical assistance', 'Technical assistance', 6)
INSERT  LSC_c_SUBGRANT_SERV_TYPE (id, abbr, description, sort_order) VALUES(7, 'Admin support', 'General administrative support - space, staff, telephone service', 7)
INSERT  LSC_c_SUBGRANT_SERV_TYPE (id, abbr, description, sort_order) VALUES(8, 'Attorney training', 'Attorney training/training development', 8)
INSERT  LSC_c_SUBGRANT_SERV_TYPE (id, abbr, description, sort_order) VALUES(9, 'Public training', 'Public or client training/training development', 9)
INSERT  LSC_c_SUBGRANT_SERV_TYPE (id, abbr, description, sort_order) VALUES(10, 'Client intake', 'Client intake/screening/referral', 10)
INSERT  LSC_c_SUBGRANT_SERV_TYPE (id, abbr, description, sort_order) VALUES(11, 'Attorney recruitment', 'Attorney recruitment', 11)
INSERT  LSC_c_SUBGRANT_SERV_TYPE (id, abbr, description, sort_order) VALUES(12, 'Litigation support', 'Litigation support', 12)
INSERT  LSC_c_SUBGRANT_SERV_TYPE (id, abbr, description, sort_order) VALUES(13, 'Attorney - compens.', 'Attorney representation - compensated', 13)
INSERT  LSC_c_SUBGRANT_SERV_TYPE (id, abbr, description, sort_order) VALUES(14, 'Attorney - pro bono', 'Attorney representation - pro bono', 14)
INSERT  LSC_c_SUBGRANT_SERV_TYPE (id, abbr, description, sort_order) VALUES(15, 'Attorney - judicare', 'Attorney representation - judicare', 15)
INSERT  LSC_c_SUBGRANT_SERV_TYPE (id, abbr, description, sort_order) VALUES(16, 'Other', 'Other', 16)

insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_c_SUBGRANT_SERV_TYPE',
		17,
		1,
		2)