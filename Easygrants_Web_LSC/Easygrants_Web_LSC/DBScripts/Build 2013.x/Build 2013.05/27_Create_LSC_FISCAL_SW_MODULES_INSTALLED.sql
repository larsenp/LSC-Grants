/****** Object:  Table [dbo].[LSC_FISCAL_SW_MODULES_INSTALLED]    Script Date: 03/22/2013 16:25:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_FISCAL_SW_MODULES_INSTALLED](
	[lsc_fiscal_sw_modules_installed_id] [int] NOT NULL,
	[lsc_comp_appl_fiscal_id] [int] NULL,
	[lsc_fiscal_sw_module_id] [int] NULL,
 CONSTRAINT [PK_LSC_FISCAL_SW_MODULES_INSTALLED] PRIMARY KEY CLUSTERED 
(
	[lsc_fiscal_sw_modules_installed_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table]
           ,[lookup_table_type_id])
     VALUES
           ('LSC_FISCAL_SW_MODULES_INSTALLED'
           ,1
           ,0
           ,1)
