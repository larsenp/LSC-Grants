/****** Object:  Table [dbo].[LSC_c_CSR_ANALYSIS_CONCLUSION]    Script Date: 05/21/2010 09:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_CSR_ANALYSIS_CONCLUSION](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_CSR_ANALYSIS_CONCLUSION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [LSC_c_CSR_ANALYSIS_CONCLUSION]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'concerns'
           ,'raise concerns'
           ,1)

INSERT INTO [LSC_c_CSR_ANALYSIS_CONCLUSION]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'no concerns'
           ,'do not raise concerns'
           ,2)

INSERT INTO [LSC_c_CSR_ANALYSIS_CONCLUSION]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (3
           ,'further review'
           ,'need to be looked into further'
           ,3)

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table]
           ,[lookup_table_type_id])
     VALUES
           ('LSC_c_CSR_ANALYSIS_CONCLUSION'
           ,4
           ,1
           ,1)
