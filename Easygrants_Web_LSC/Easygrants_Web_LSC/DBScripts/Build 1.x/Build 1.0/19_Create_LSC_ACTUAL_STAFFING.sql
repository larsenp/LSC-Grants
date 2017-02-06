USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_ACTUAL_STAFFING]    Script Date: 02/01/2008 09:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_ACTUAL_STAFFING](
	[lsc_actual_staffing_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[lsc_staff_category_id] [int] NULL,
	[supervising_attys] [int] NULL,
	[other_attys] [int] NULL,
	[paralegals] [int] NULL,
	[other_staff] [int] NULL,
 CONSTRAINT [PK_LSC_ACTUAL_STAFFING] PRIMARY KEY CLUSTERED 
(
	[lsc_actual_staffing_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_ACTUAL_STAFFING', 1, 0)