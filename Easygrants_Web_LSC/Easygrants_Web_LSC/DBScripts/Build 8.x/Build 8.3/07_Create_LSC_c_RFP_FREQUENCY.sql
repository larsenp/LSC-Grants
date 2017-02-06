
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_RFP_FREQUENCY](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
	[End_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_RFP_FREQUENCY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_c_RFP_FREQUENCY'
           ,1
           ,0)