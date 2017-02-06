USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_c_SERVICE_AREA_STATUS]    Script Date: 07/08/2008 18:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_SERVICE_AREA_STATUS](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_SERVICE_AREA_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_c_SERVICE_AREA_STATUS
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(1,
		'C',
		'Current',
		1)

INSERT LSC_c_SERVICE_AREA_STATUS
	(id,
	abbr,
	description,
	sort_order)
	VALUES
		(2,
		'F',
		'Former',
		2)

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_c_SERVICE_AREA_STATUS', 3, 1)
	
