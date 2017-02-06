/****** Object:  Table [dbo].[LSC_PRO_BONO_ELIGIBILITY_REVIEW]    Script Date: 06/21/2014 11:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_PRO_BONO_ELIGIBILITY_REVIEW](
	[lsc_pro_bono_eligibility_review_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[project_category] [varchar](100) NULL,
	[current_lsc_grantee] [bit] NULL,
	[complete_basic_info] [bit] NULL,
	[budget_narrative] [bit] NULL,
	[subgrant_contract] [bit] NULL,
	[resumes_key_staff] [bit] NULL,
 CONSTRAINT [PK_LSC_PRO_BONO_ELIGIBILITY_REVIEW] PRIMARY KEY CLUSTERED 
(
	[lsc_pro_bono_eligibility_review_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO s_ID_GEN (table_name,next_id, is_code_table) VALUES ('LSC_PRO_BONO_ELIGIBILITY_REVIEW',1,0)