/****** Object:  Table [dbo].[LSC_WF_TASK_ASSIGNMENT]    Script Date: 03/26/2008 11:47:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_WF_TASK_ASSIGNMENT](
[lsc_wf_task_assignment_id] [int] NOT NULL,
[wf_task_assignment_id] [int] NULL,
[new_applicant_no_board] [bit] NULL,
CONSTRAINT [PK_LSC_WF_TASK_ASSIGNMENT] PRIMARY KEY CLUSTERED
(
[lsc_wf_task_assignment_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

insert s_id_gen (table_name, next_id, is_code_table)
values ('LSC_WF_TASK_ASSIGNMENT', 1, 0)