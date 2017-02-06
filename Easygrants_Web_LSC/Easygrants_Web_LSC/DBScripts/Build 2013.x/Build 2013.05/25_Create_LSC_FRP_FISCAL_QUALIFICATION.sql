/****** Object:  Table [dbo].[LSC_FRP_FISCAL_QUALIFICATION]    Script Date: 03/22/2013 16:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_FRP_FISCAL_QUALIFICATION](
	[lsc_frp_fiscal_qualification_id] [int] NOT NULL,
	[lsc_comp_appl_fiscal_id] [int] NULL,
	[lsc_fiscal_qualification_id] [int] NULL,
 CONSTRAINT [PK_LSC_FRP_FISCAL_QUALIFICATION] PRIMARY KEY CLUSTERED 
(
	[lsc_frp_fiscal_qualification_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table]
           ,[lookup_table_type_id])
     VALUES
           ('LSC_FRP_FISCAL_QUALIFICATION'
           ,1
           ,0
           ,1)
