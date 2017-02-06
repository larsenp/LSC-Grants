USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_CLIENT_SERVICES]    Script Date: 02/01/2008 15:34:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_CLIENT_SERVICES](
	[lsc_client_services_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[lsc_legal_problem_type_id] [int] NULL,
	[cases_closed_limited_svc] [int] NULL,
	[cases_closed_extended_svc] [int] NULL,
	[cases_open] [int] NULL,
 CONSTRAINT [PK_LSC_CLIENT_SERVICES] PRIMARY KEY CLUSTERED 
(
	[lsc_client_services_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_CLIENT_SERVICES', 1, 0)