/****** Object:  Table [dbo].[LSC_c_TIG_CONTRACT_ENTITY_TYPE]    Script Date: 04/22/2011 16:48:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_TIG_CONTRACT_ENTITY_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_TIG_CONTRACT_ENTITY_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [LSC_c_TIG_CONTRACT_ENTITY_TYPE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'LSC Grantee'
           ,'LSC Grantee'
           ,1)

INSERT INTO [LSC_c_TIG_CONTRACT_ENTITY_TYPE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'Other Nonprofit'
           ,'Non-LSC Grantee, Not-For-Profit Organization'
           ,2)

INSERT INTO [LSC_c_TIG_CONTRACT_ENTITY_TYPE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (3
           ,'For-Profit'
           ,'For-Profit Organization'
           ,3)

Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_c_TIG_CONTRACT_ENTITY_TYPE',
		1,
		4,
		2)

