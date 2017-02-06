/****** Object:  Table [dbo].[LSC_WFTA_1607_REVIEW]    Script Date: 04/18/2013 13:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_WFTA_1607_REVIEW](
	[lsc_wfta_1607_review_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[follow_up_results] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_WFTA_1607_REVIEW] PRIMARY KEY CLUSTERED 
(
	[lsc_wfta_1607_review_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	VALUES
		('LSC_WFTA_1607_REVIEW'
		,1
		,0
		,1)
