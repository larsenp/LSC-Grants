/****** Object:  Table [dbo].[LSC_OCE_VISIT]    Script Date: 07/18/2011 10:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_OCE_VISIT](
	[lsc_oce_visit_id] [int] NOT NULL,
	[organization_id] [int] NULL,
	[oce_visit_type_id] [int] NULL,
	[start_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_OCE_VISIT] PRIMARY KEY CLUSTERED 
(
	[lsc_oce_visit_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


INSERT s_ID_GEN
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	VALUES('LSC_OCE_VISIT',
		1,
		0,
		1)
