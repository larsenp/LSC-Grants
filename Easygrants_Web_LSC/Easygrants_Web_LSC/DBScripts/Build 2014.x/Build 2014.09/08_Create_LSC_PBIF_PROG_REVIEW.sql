CREATE TABLE [dbo].[LSC_PBIF_PROG_REVIEW](
	[lsc_pbif_prog_review_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[overall_comment] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_PBIF_PROG_REVIEW] PRIMARY KEY CLUSTERED 
(
	[lsc_pbif_prog_review_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT INTO s_ID_GEN (table_name,next_id, is_code_table) VALUES ('LSC_PBIF_PROG_REVIEW',1,0)