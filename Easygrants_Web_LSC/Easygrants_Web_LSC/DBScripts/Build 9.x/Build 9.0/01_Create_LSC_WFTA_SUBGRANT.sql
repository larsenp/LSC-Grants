/****** Object:  Table dbo.LSC_WFTA_SUBGRANT    Script Date: 08/16/2010 13:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE dbo.LSC_WFTA_SUBGRANT(
	lsc_wfta_subgrant_id int NOT NULL,
	wf_task_assignment_id int NULL,
	start_date datetime NULL,
	end_date datetime NULL,
	subgrantee_name varchar(100) NULL,
	subgrant_amount int NULL,
	is_renewal bit NULL,
	subgrantee_addr1 varchar(150) NULL,
	subgrantee_addr2 varchar(150) NULL,
	subgrantee_city varchar(50) NULL,
	subgrantee_state_prov_id int NULL,
	subgrantee_zip varchar(30) NULL,
	subgrantee_pd_first varchar(100) NULL,
	subgrantee_pd_middle varchar(50) NULL,
	subgrantee_pd_last varchar(100) NULL,
	subgrantee_pd_email varchar(100) NULL,
	subgrantee_pd_phone varchar(50) NULL,
	counties varchar(max) NULL,
	subgrant_purpose varchar(max) NULL,
	lsc_subgrant_grant_type_id int NULL,
	lsc_fund_balance_id int NULL,
	lsc_fund_balance_omitted int NULL,
	lsc_fund_balance_not_applicable varchar(max) NULL,
	fund_case_services bit NULL,
	most_recent_4q_from datetime NULL,
	most_recent_4q_to datetime NULL,
	most_recent_lsc int NULL,
	most_recent_non_lsc int NULL,
	preceding_lsc int NULL,
	preceding_non_lsc int NULL,
	monitoring_procedure_other varchar(max) NULL,
	[pai_related] [bit] NULL,
	[state_support_act] [bit] NULL,
	other_services varchar(max) NULL,
	other_targeted_group varchar(max) NULL,
 CONSTRAINT [PK_LSC_WFTA_SUBGRANT] PRIMARY KEY CLUSTERED 
(
	lsc_wfta_subgrant_id ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_WFTA_SUBGRANT',
		1,
		0,
		1)