--Many columns in the LSC_SOFTWARE_QUESTION needed increased capacity because of the size of migrated data.

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN hotdocs_use_description varchar(max)

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN swws_financial_contribution varchar(max)

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN swws_financial_contribution_amount varchar(max)

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN swws_content_contribution varchar(max)

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN swws_content_description varchar(max)

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN swws_program_priorities varchar(max)

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN swws_content_update_protocols varchar(max)

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN swws_content_languages varchar(max)

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN swws_stakeholder_mtgs varchar(max)

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN swws_outreach varchar(max)

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN swws_outreach_description varchar(max)

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN swws_staff_familiar varchar(max)

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN swws_usage_monitoring varchar(max)

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN swws_usage_info_evaluation varchar(max)

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN swws_accessibility varchar(max)

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN swws_delivery_role varchar(max)

ALTER TABLE LSC_SOFTWARE_QUESTION
	ALTER COLUMN applicant_internet_usage varchar(max)
