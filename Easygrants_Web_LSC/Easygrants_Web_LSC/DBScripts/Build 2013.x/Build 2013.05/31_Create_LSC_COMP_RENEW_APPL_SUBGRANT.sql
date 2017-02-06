/****** Object:  Table [dbo].[LSC_COMP_RENEW_APPL_SUBGRANT]    Script Date: 03/28/2013 10:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_COMP_RENEW_APPL_SUBGRANT](
	[lsc_comp_renew_appl_subgrant_id] [int] NOT NULL,
	[organization_id] [int] NULL,
	[time_period_id] [int] NULL,
	[has_current_lsc_subgrants] [bit] NULL,
	[current_lsc_pai_subgrants_count] [int] NULL,
	[current_lsc_non_pai_subgrants_count] [int] NULL,
	[plans_upcoming_lsc_subgrants] [bit] NULL,
	[upcoming_lsc_pai_subgrants_count] [int] NULL,
	[upcoming_lsc_non_pai_subgrants_count] [int] NULL,
	[has_current_non_lsc_pai_subgrants] [bit] NULL,
	[current_non_lsc_pai_subgrants_count] [int] NULL,
	[plans_upcoming_non_lsc_pai_subgrants] [bit] NULL,
	[upcoming_non_lsc_pai_subgrants_count] [int] NULL,
 CONSTRAINT [PK_LSC_COMP_RENEW_APPL_SUBGRANT] PRIMARY KEY CLUSTERED 
(
	[lsc_comp_renew_appl_subgrant_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table]
           ,[lookup_table_type_id])
     VALUES
           ('LSC_COMP_RENEW_APPL_SUBGRANT'
           ,1
           ,0
           ,1)