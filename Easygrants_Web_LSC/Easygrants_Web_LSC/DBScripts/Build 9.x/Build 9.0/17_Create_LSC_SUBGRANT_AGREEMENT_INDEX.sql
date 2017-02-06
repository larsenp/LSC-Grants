/****** Object:  Table [dbo].[LSC_SUBGRANT_AGREEMENT_INDEX]    Script Date: 09/01/2010 10:05:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_SUBGRANT_AGREEMENT_INDEX](
	[lsc_subgrant_agreement_index_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[terms_con_pg] [varchar](20) NULL,
	[terms_con_para] [varchar](20) NULL,
	[fund_xfer_pg] [varchar](20) NULL,
	[fund_xfer_para] [varchar](20) NULL,
	[term_agree_pg] [varchar](20) NULL,
	[term_agree_para] [varchar](20) NULL,
	[bond_cover_pg] [varchar](20) NULL,
	[bond_cover_para] [varchar](20) NULL,
	[audit_pg] [varchar](20) NULL,
	[audit_para] [varchar](20) NULL,
	[malpractice_pg] [varchar](20) NULL,
	[malpractice_para] [varchar](20) NULL,
	[gov_lsc_pg] [varchar](20) NULL,
	[gov_lsc_para] [varchar](20) NULL,
	[lsc_oversight_pg] [varchar](20) NULL,
	[lsc_oversight_para] [varchar](20) NULL,
	[audit_compliance_pg] [varchar](20) NULL,
	[audit_compliance_para] [varchar](20) NULL,
	[termination_pg] [varchar](20) NULL,
	[termination_para] [varchar](20) NULL,
	[priority_conflict_pg] [varchar](20) NULL,
	[priority_conflict_para] [varchar](20) NULL,
	[recip_respons_pg] [varchar](20) NULL,
	[recip_respons_para] [varchar](20) NULL,
	[fee_retain_pg] [varchar](20) NULL,
	[fee_retain_para] [varchar](20) NULL,
	[fund_training_pg] [varchar](20) NULL,
	[fund_training_para] [varchar](20) NULL,
	[fund_educ_pg] [varchar](20) NULL,
	[fund_educ_para] [varchar](20) NULL,
	[migrant_serv_pg] [varchar](20) NULL,
	[migrant_serv_para] [varchar](20) NULL,
	[advocacy_pg] [varchar](20) NULL,
	[advocacy_para] [varchar](20) NULL,
	[fund_balance_pg] [varchar](20) NULL,
	[fund_balance_para] [varchar](20) NULL,
 CONSTRAINT [PK_LSC_SUBGRANT_AGREEMENT_INDEX] PRIMARY KEY CLUSTERED 
(
	[lsc_subgrant_agreement_index_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT s_ID_GEN
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	VALUES('LSC_SUBGRANT_AGREEMENT_INDEX',
		1,
		0,
		1)
