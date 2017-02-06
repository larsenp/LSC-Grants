--Add new columns (Mantis 2873)

ALTER TABLE LSC_TIG_CONTRACT
	ADD legal_content_activity_comment varchar(max) null,
		legal_decision_activity_comment varchar(max) null,
		is_subgrant bit null

