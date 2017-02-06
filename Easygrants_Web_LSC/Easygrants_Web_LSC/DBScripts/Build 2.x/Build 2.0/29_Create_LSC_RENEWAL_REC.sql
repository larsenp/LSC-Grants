/****** Object:  Table [dbo].[LSC_RENEWAL_REC]    Script Date: 06/04/2008 13:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_RENEWAL_REC](
	[lsc_renewal_rec_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[lsc_renewal_recommendation_id] [int] NULL,
	[further_review_comment] [varchar](max) NULL,
	[rationale_non_renewal] [varchar](max) NULL,
	[no_grant_conditions] [bit] NULL,
	[special_grant_conditions] [varchar](max) NULL,
	[other_issues] [varchar](max) NULL,
	[no_other_issues] [bit] NULL,
	[primary_reader_person_id] [int] NULL,
	[primary_reader_date] [datetime] NULL,
	[rec_reader_person_id] [int] NULL,
	[rec_reader_date] [datetime] NULL,
	[opp_mgmt_person_id] [int] NULL,
	[opp_mgmt_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_RENEWAL_REC] PRIMARY KEY CLUSTERED 
(
	[lsc_renewal_rec_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_RENEWAL_REC', 1, 0)