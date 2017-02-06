/****** Object:  Table [dbo].[LSC_c_GAR_FORM_GROUP]    Script Date: 04/24/2012 11:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_GAR_FORM_GROUP](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_GAR_FORM_GROUP] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_c_GAR_FORM_GROUP
	(id,
	abbr,
	description)
	VALUES (1,
		'Actual',
		'Actual')

INSERT LSC_c_GAR_FORM_GROUP
	(id,
	abbr,
	description)
	VALUES (2,
		'Projected',
		'Projected')

INSERT LSC_c_GAR_FORM_GROUP
	(id,
	abbr,
	description)
	VALUES (3,
		'Interim',
		'Interim')

INSERT INTO [EasygrantsDev].[dbo].[s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table]
           ,[lookup_table_type_id])
     VALUES
           ('LSC_c_GAR_FORM_GROUP'
           ,4
           ,1
           ,1)