ALTER TABLE LSC_COMP_APPL_FISCAL
	ADD finance_report_review_interval_other VARCHAR(50)
		,acctg_ctrl_review_interval_other VARCHAR(50)

GO

ALTER TABLE LSC_COMP_APPL_FISCAL
	ALTER COLUMN variance_analysis_preparer_mgmt_other VARCHAR(50)

GO

ALTER TABLE LSC_COMP_APPL_FISCAL
	ALTER COLUMN variance_analysis_preparer_ipa_other VARCHAR(50)

