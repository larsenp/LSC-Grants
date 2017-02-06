/****** Object:  Table [dbo].[LSC_c_TIG_GRANT_CLASSIFICATION]    Script Date: 03/24/2010 15:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_TIG_GRANT_CLASSIFICATION](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_TIG_GRANT_CLASSIFICATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [LSC_c_TIG_GRANT_CLASSIFICATION]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'Statewide'
           ,'Statewide Web Sites'
           ,1)

INSERT INTO [LSC_c_TIG_GRANT_CLASSIFICATION]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'Special'
           ,'Special Projects'
           ,2)

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table]
           ,[lookup_table_type_id])
     VALUES
           ('LSC_c_TIG_GRANT_CLASSIFICATION'
           ,3
           ,1
           ,2)
