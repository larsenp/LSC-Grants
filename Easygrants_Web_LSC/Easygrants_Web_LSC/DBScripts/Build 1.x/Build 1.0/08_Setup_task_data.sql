
INSERT INTO [a_PROGRAM]([id], [abbr], [description], [sort_order], [consortia_id]) 
	VALUES(1, 'Competition/Renewal', 'Competition/Renewal', NULL, NULL);
UPDATE [s_ID_GEN] SET [NEXT_ID] = 2 where [table_name] = 'a_PROGRAM'

INSERT INTO [a_COMPETITION]([id], [abbr], [description], [program_id], [sort_order], [competition_type_id], [portfolio_id]) 
	VALUES(1, 'Alabama', 'AL-4', 1, NULL, NULL, NULL);
UPDATE [s_ID_GEN] SET [NEXT_ID] = 2 where [table_name] = 'a_COMPETITION'

INSERT INTO [a_WF_PROJECT]([id], [abbr], [description], [competition_id], [project_type_id], [support_email_address], [tech_email_address], [content_email_address], [start_date], [end_date], [sort_order], [final_pdf_report_key], [faculty_date], [eligibility_date], [create_user], [create_date], [modify_user], [modify_date], [time_period_id], [auto_generate_payment], [no_auto_generate_payment], [default_payment_setup], [payment_process_id], [auto_generate_report], [no_auto_generate_report], [default_report_setup], [report_process_id], [award_term], [guideline], [invitation_code]) 
	VALUES(1, NULL, 'Competition 2008', 1, NULL, 'support@foundation.org', NULL, 'support@foundation.org', '2007-10-01 00:00:00', '2008-11-30 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL);
UPDATE [s_ID_GEN] SET [NEXT_ID] = 2 where [table_name] = 'a_WF_PROJECT'

INSERT INTO [a_WF_TASK]([id], [abbr], [description], [wf_task_type_id], [sort_order], [mail_address], [comments], [wf_task_title], [wf_task_program], [parent_task_id], [create_user], [create_date], [modify_user], [modify_date]) 
	VALUES(1, 'SNIC', 'Submit Notice of Intent to Compete', 1, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
UPDATE [s_ID_GEN] SET [NEXT_ID] = 2 where [table_name] = 'a_WF_TASK'

INSERT INTO [a_WF_PROJECT_TASK]([id], [wf_project_id], [wf_task_id], [start_date], [open_date], [due_date], [close_date], [end_date], [sort_order], [create_user], [create_date], [modify_user], [modify_date], [description], [default_page_key], [default_outcome_id], [submitted_outcome_id], [generation_id]) 
	VALUES(1, 1, 1, '2007-10-01 00:00:00', '2007-10-01 00:00:00', '2008-10-01 00:00:00', '2008-10-01 00:00:00', '2009-10-01 00:00:00', 1, NULL, NULL, NULL, NULL, '2008 Submit Notice of Intent to Compete', NULL, NULL, NULL, 1);
UPDATE [s_ID_GEN] SET [NEXT_ID] = 2 where [table_name] = 'a_WF_PROJECT_TASK'

INSERT INTO [a_WF_TASK_MODULE]([wf_task_module_id], [wf_task_id], [wf_task_role_id], [module_name], [module_config_filename], [outcome_config_filename], [report_output_definition_id]) 
	VALUES(1, 1, 1, 'LOI', 'LOIModuleConfig', 'LOIOutcomeConfig', NULL);
UPDATE [s_ID_GEN] SET [NEXT_ID] = 2 where [table_name] = 'a_WF_TASK_MODULE'

INSERT INTO [a_WF_TASK_OUTCOME]([id], [task_id], [role_id], [abbr], [description], [outcome_key], [sort_order]) 
	VALUES(1, 1, 1, 'IN PROC', 'In Process', NULL, 1);

INSERT INTO [a_WF_TASK_OUTCOME]([id], [task_id], [role_id], [abbr], [description], [outcome_key], [sort_order]) 
	VALUES(2, 1, 1, 'SUBMITTED', 'Submitted', NULL, 2);
UPDATE [s_ID_GEN] SET [NEXT_ID] = 3 where [table_name] = 'a_WF_TASK_OUTCOME'
