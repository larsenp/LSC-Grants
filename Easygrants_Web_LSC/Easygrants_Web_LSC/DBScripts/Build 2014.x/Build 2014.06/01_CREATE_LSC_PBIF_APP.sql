
/****** Object:  Table [dbo].[LSC_PBIF_APP]    Script Date: 5/13/2014 1:58:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[LSC_PBIF_APP](
	[lsc_pbif_app_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[project_title] [varchar](500) NULL,
	[amount_requested] int NULL,
	[total_budget] int NULL,
	[parallel_tig] [bit] NULL,
	[exec_summary] [varchar](max) NULL,
	[narrative] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_PBIF_APP] PRIMARY KEY CLUSTERED 
(
	[lsc_pbif_app_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


INSERT INTO s_ID_GEN (table_name,next_id, is_code_table) VALUES ('LSC_PBIF_APP',1,0)
GO
