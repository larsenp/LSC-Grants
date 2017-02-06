SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_SIGNIFICANT_ACCOMPLISHMENTS](
	[lsc_significant_accomplishments_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[organization_id] [int] NULL,
	[time_period_id] [int] NULL,
	[example1_clients_type] [int] NULL,
	[example1_clients_desc] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[example2_clients_type] [int] NULL,
	[example2_clients_desc] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[example3_clients_type] [int] NULL,
	[example3_clients_desc] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[example1_clientsPAI_type] [int] NULL,
	[example1_clientsPAI_desc] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[example2_clientsPAI_type] [int] NULL,
	[example2_clientsPAI_desc] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[example3_clientsPAI_type] [int] NULL,
	[example3_clientsPAI_desc] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[example1_justice_type] [int] NULL,
	[example1_justice_desc] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[example2_justice_type] [int] NULL,
	[example2_justice_desc] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[example3_justice_type] [int] NULL,
	[example3_justice_desc] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[example1_other_providers_type] [int] NULL,
	[example1_other_providers_desc] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[example2_other_providers_type] [int] NULL,
	[example2_other_providers_desc] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[example3_other_providers_type] [int] NULL,
	[example3_other_providers_desc] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[other_full_service_provider] [bit] NULL,
 CONSTRAINT [PK_LSC_SIGNIFICANT_ACCOMPLISHMENTS] PRIMARY KEY CLUSTERED 
(
	[lsc_significant_accomplishments_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]




Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_SIGNIFICANT_ACCOMPLISHMENTS',
		1,
		0,
		1)