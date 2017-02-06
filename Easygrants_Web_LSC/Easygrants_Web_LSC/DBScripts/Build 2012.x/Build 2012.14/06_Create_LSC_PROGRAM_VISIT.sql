/****** Object:  Table [dbo].[LSC_PROGRAM_VISIT]    Script Date: 09/17/2012 13:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_PROGRAM_VISIT](
	[lsc_program_visit_id] [int] NOT NULL,
	[organization_id] [int] NULL,
	[lsc_internal_office_id] [int] NULL,
	[lsc_program_visit_type_id] [int] NULL,
	[visit_start_date] [datetime] NULL,
	[visit_end_date] [datetime] NULL,
	[visit_date_description] [varchar](max) NULL,
	[team_lead_person_id] [int] NULL,
	[draft_report_sent_date] [datetime] NULL,
	[final_report_sent_date] [datetime] NULL,
	[is_early_year_pqv] [bit] NULL,
	[joint_visit] [bit] NULL,
	[notes] [varchar](max) NULL
 CONSTRAINT [PK_LSC_PROGRAM_VISIT] PRIMARY KEY CLUSTERED 
(
	[lsc_program_visit_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	VALUES('LSC_PROGRAM_VISIT'
		,1
		,0
		,1)