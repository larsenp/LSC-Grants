/****** Object:  Table [dbo].[LSC_OA1]    Script Date: 05/22/2008 09:05:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_OA1](
	[lsc_oa1_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[chk_I_A] [bit] NULL,
	[chk_I_B] [bit] NULL,
	[chk_II_C_1] [bit] NULL,
	[chk_II_C_2] [bit] NULL,
	[chk_II_C_3] [bit] NULL,
	[chk_II_C_4] [bit] NULL,
	[chk_II_C_5] [bit] NULL,
	[chk_II_C_6] [bit] NULL,
	[chk_II_C_7] [bit] NULL,
	[chk_II_C_8] [bit] NULL,
	[chk_II_C_9] [bit] NULL,
	[chk_II_C_10] [bit] NULL,
	[comment_II_C] [varchar](max) NULL,
	[chk_II_C_11] [bit] NULL,
	[comment_II_C_11] [varchar](max) NULL,
	[comment_III] [varchar](max) NULL,
	[staff_reader_person_id] [int] NULL,
	[staff_reader_date] [datetime] NULL,
	[opp_mgmt_person_id] [int] NULL,
	[opp_mgmt_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_OA1] PRIMARY KEY CLUSTERED 
(
	[lsc_oa1_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_OA1', 1, 0)
	