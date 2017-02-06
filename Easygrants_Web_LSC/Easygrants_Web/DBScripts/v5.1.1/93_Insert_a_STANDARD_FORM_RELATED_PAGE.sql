INSERT INTO [a_STANDARD_FORM_RELATED_PAGE]([id], [standard_form_id], [page_key], [page_title], [control_path], [after_submit_control_path]) 
	VALUES(60, 61, 'ParticipantSummary', 'Participant Summary', 'Implementation/Modules/ReviewStage/Controls/Page/ParticipantSummary.ascx', NULL);

update s_id_gen set next_id=61 where table_name='a_STANDARD_FORM_RELATED_PAGE';