CREATE TABLE [dbo].[LSC_REVIEW_COMP_APPL_OCE_STAFF](
	[lsc_review_comp_appl_oce_staff_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[score_comment] [varchar](max) NULL,
	[score] [int] NULL,
	[overall_comment] [varchar](max) NULL,
	[subject_fiscal_sgc] [bit] NULL,
	[fiscal_sgc_completed] [bit] NULL,
	[addl_action_to_complete] [varchar](max) NULL,
	[funding_term_recommendation_id] [int] NULL,
	[funding_term_recommendation_other] [varchar](max) NULL,
	[funding_term_recommendation_reason] [varchar](max) NULL,
	[impose_fiscal_sgc] [bit] NULL,
	[recommended_fiscal_sgc] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_REVIEW_COMP_APPL_OCE_STAFF] PRIMARY KEY CLUSTERED 
(
	[lsc_review_comp_appl_oce_staff_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table]
           ,[lookup_table_type_id])
     VALUES
           ('LSC_REVIEW_COMP_APPL_OCE_STAFF'
           ,1
           ,0
           ,1)