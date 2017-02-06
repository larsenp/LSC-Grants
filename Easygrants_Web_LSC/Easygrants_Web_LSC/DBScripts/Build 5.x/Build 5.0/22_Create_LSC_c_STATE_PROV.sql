/****** Object:  Table [dbo].[LSC_c_STATE_PROV]    Script Date: 03/25/2009 14:44:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_STATE_PROV](
	[id] [int] NOT NULL,
	[state_province_id] [int] NULL,
	[region_code] [varchar](1) NULL,
	[state_code] [varchar](2) NULL,
 CONSTRAINT [PK_LSC_c_STATE_PROV] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_c_STATE_PROV
	(id,
	state_province_id,
	region_code,
	state_code)
	SELECT sp.id,
		sp.id ,
		sd.region ,
		sd.state_code
		FROM [LSC-SQL].RINDB.dbo.states_desc sd
		JOIN c_STATE_PROV sp ON sd.state = sp.abbr


INSERT s_ID_GEN (table_name, next_id, is_code_table)
	VALUES ('LSC_c_STATE_PROV', 72, 0)
