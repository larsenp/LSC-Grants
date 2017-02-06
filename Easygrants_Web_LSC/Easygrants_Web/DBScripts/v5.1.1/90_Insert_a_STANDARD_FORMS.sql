INSERT INTO [a_STANDARD_FORMS]([id], [form_type_id], [name], [description], [page_key], [page_title], [control_path], [after_submit_control_path], [help_file_path], [is_client]) 
	VALUES(66, 1, 'Sys - Internal Review with Collexis', 'Internal Review with Collexis', 'InternalReviewCollexis', 'Internal Review', 'Implementation/Modules/Review/Controls/Page/InternalReviewCollexis.ascx', NULL, NULL, 0);

update s_id_gen set next_id=67 where table_name='a_STANDARD_FORMS';