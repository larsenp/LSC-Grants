/****** Object:  Table [dbo].[LSC_SUBRECIPIENT_BUDGET]    Script Date: 08/30/2010 09:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_SUBRECIPIENT_BUDGET](
	[lsc_subrecipient_budget_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[lawyers] [int] NULL,
	[paralegals] [int] NULL,
	[other_staff] [int] NULL,
	[employee_benefits] [int] NULL,
	[space_rent] [int] NULL,
	[space_mortgage] [int] NULL,
	[space_other] [int] NULL,
	[equip_rental] [int] NULL,
	[off_supplies] [int] NULL,
	[telephone] [int] NULL,
	[travel_board] [int] NULL,
	[travel_staff] [int] NULL,
	[training_board] [int] NULL,
	[training_staff] [int] NULL,
	[library] [int] NULL,
	[insurance] [int] NULL,
	[dues] [int] NULL,
	[audit] [int] NULL,
	[litigation] [int] NULL,
	[property_acq] [int] NULL,
	[purchase_pmt] [int] NULL,
	[contract_client] [int] NULL,
	[contract_applicant] [int] NULL,
	[other] [int] NULL,
	[note_1] [bit] NULL,
	[note_2] [bit] NULL,
	[note_3] [bit] NULL,
 CONSTRAINT [PK_LSC_SUBRECIPIENT_BUDGET] PRIMARY KEY CLUSTERED 
(
	[lsc_subrecipient_budget_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_SUBRECIPIENT_BUDGET',
		1,
		0,
		1)