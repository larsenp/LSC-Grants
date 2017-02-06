/****** Object:  Table [dbo].[LSC_FISCAL_INTERNAL_CONTROLS_INSTITUTED]    Script Date: 03/22/2013 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LSC_FISCAL_INTERNAL_CONTROLS_INSTITUTED](
	[lsc_fiscal_internal_controls_instituted_id] [int] NOT NULL,
	[lsc_comp_appl_fiscal_id] [int] NULL,
	[lsc_fiscal_internal_control_area_id] [int] NULL,
	[is_instituted] [bit] NULL,
	[date_last_updated] [datetime] NULL,
 CONSTRAINT [PK_LSC_FISCAL_INTERNAL_CONTROLS_INSTITUTED] PRIMARY KEY CLUSTERED 
(
	[lsc_fiscal_internal_controls_instituted_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table]
           ,[lookup_table_type_id])
     VALUES
           ('LSC_FISCAL_INTERNAL_CONTROLS_INSTITUTED'
           ,1
           ,0
           ,1)
