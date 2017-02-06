/****** Object:  Table [dbo].[LSC_ORGANIZATION]    Script Date: 01/27/2009 17:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_ORGANIZATION](
	[lsc_organization_id] [int] NOT NULL,
	[organization_id] [int] NULL,
	[reviewer_person_id] [int] NULL,
 CONSTRAINT [PK_LSC_ORGANIZATION] PRIMARY KEY CLUSTERED 
(
	[lsc_organization_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_ORGANIZATION', 1, 0)
