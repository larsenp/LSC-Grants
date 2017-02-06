USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_BOARD_STRUCTURE]    Script Date: 02/05/2008 10:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_BOARD_STRUCTURE](
	[lsc_board_structure_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[mccollum_atty_bylaw] [int] NULL,
	[other_atty_bylaw] [int] NULL,
	[client_member_bylaw] [int] NULL,
	[other_member_bylaw] [int] NULL,
	[mccollum_atty_less_90] [int] NULL,
	[other_atty_less_90] [int] NULL,
	[client_member_less_90] [int] NULL,
	[other_member_less_90] [int] NULL,
	[mccollum_atty_90_day_1_yr] [int] NULL,
	[other_atty_90_day_1_yr] [int] NULL,
	[client_member_90_day_1_yr] [int] NULL,
	[other_member_90_day_1_yr] [int] NULL,
	[mccollum_atty_greater_1_yr] [int] NULL,
	[other_atty_greater_1_yr] [int] NULL,
	[client_member_greater_1_yr] [int] NULL,
	[other_member_greater_1_yr] [int] NULL,
 CONSTRAINT [PK_LSC_BOARD_STRUCTURE] PRIMARY KEY CLUSTERED 
(
	[lsc_board_structure_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_BOARD_STRUCTURE', 1, 0)