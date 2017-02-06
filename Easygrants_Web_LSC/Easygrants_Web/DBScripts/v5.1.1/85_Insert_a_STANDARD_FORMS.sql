INSERT INTO [a_STANDARD_FORMS]([id], [form_type_id], [name], [description], [page_key], [page_title], [control_path], [after_submit_control_path], [help_file_path], [is_client]) 
	VALUES(65, 1, 'Sys - Confidentiality Agreement', 'Confidentiality Agreement', 'ConfidentialityAgreement', 'Confidentiality Agreement', 'Implementation/Modules/ReviewStage/Controls/Page/ConfidentialityAgreement.ascx', NULL, NULL, 0);

update s_id_gen set next_id=66 where table_name='a_STANDARD_FORMS';