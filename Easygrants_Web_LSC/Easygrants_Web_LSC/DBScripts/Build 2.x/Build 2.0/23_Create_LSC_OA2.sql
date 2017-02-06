/****** Object:  Table [dbo].[LSC_OA2]    Script Date: 06/17/2008 09:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_OA2](
	[lsc_oa2_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[fund_total] [bit] NULL,
	[fund_total_cond] [bit] NULL,
	[fund_all] [bit] NULL,
	[fund_restrict] [bit] NULL,
	[no_fund] [bit] NULL,
	[part_2_comment] [varchar](max) NULL,
	[no_further_review] [bit] NULL,
	[part_3_comment] [varchar](max) NULL,
	[staff_reader_person_id] [int] NULL,
	[staff_reader_date] [datetime] NULL,
	[opp_mgmt_person_id] [int] NULL,
	[opp_mgmt_date] [datetime] NULL,
	[no_grant_conditions] [bit] NULL,
	[part_4_comment] [varchar](max) NULL,
	[no_other_issues] [bit] NULL,
	[part_5_comment] [varchar](max) NULL,
	[special_grant_conditions] [bit] NULL,
	[special_grant_condition_language] [varchar](max) NULL,
	[lsc_funding_term_id] [int] NULL,
 CONSTRAINT [PK_LSC_OA2] PRIMARY KEY CLUSTERED 
(
	[lsc_oa2_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_OA2', 1, 0)
