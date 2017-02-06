INSERT INTO [a_WF_TASK]
           ([id]
           ,[abbr]
           ,[description]
           ,[wf_task_type_id]
           ,[is_copy_allowed]
           ,[is_external_help_url]
           ,[include_submission_communication])
     VALUES
           (66
           ,'Submit Post-PQV Competitive Grant Application'
           ,'Submit Post-PQV Competitive Grant Application'
           ,1
           ,0
           ,0
           ,0)

INSERT INTO [a_WF_TASK]
           ([id]
           ,[abbr]
           ,[description]
           ,[wf_task_type_id]
           ,[is_copy_allowed]
           ,[is_external_help_url]
           ,[include_submission_communication])
     VALUES
           (67
           ,'Submit Post-PQV Grant Renewal Application'
           ,'Submit Post-PQV Grant Renewal Application'
           ,4
           ,0
           ,0
           ,0)

INSERT INTO [a_WF_TASK]
           ([id]
           ,[abbr]
           ,[description]
           ,[wf_task_type_id]
           ,[is_copy_allowed]
           ,[is_external_help_url]
           ,[include_submission_communication])
     VALUES
           (68
           ,'Review Post-PQV Grant Renewal Application'
           ,'Review Post-PQV Grant Renewal Application'
           ,4
           ,0
           ,0
           ,0)

INSERT INTO [a_WF_TASK]
           ([id]
           ,[abbr]
           ,[description]
           ,[wf_task_type_id]
           ,[is_copy_allowed]
           ,[is_external_help_url]
           ,[include_submission_communication])
     VALUES
           (69
           ,'Review Post-PQV Grant Renewal Application'
           ,'Review Post-PQV Grant Renewal Application'
           ,1
           ,0
           ,0
           ,0)

UPDATE s_ID_GEN
	SET next_id = 70
	WHERE table_name = 'a_WF_TASK'

INSERT INTO [a_WF_TASK_OUTCOME]
           ([id]
           ,[task_id]
           ,[role_id]
           ,[abbr]
           ,[description])
     VALUES
           (143
           ,66
           ,1
           ,'IN PROC'
           ,'In Process')

INSERT INTO [a_WF_TASK_OUTCOME]
           ([id]
           ,[task_id]
           ,[role_id]
           ,[abbr]
           ,[description])
     VALUES
           (144
           ,66
           ,1
           ,'SUBMITTED'
           ,'Submitted')

INSERT INTO [a_WF_TASK_OUTCOME]
           ([id]
           ,[task_id]
           ,[role_id]
           ,[abbr]
           ,[description])
     VALUES
           (145
           ,67
           ,1
           ,'IN PROC'
           ,'In Process')

INSERT INTO [a_WF_TASK_OUTCOME]
           ([id]
           ,[task_id]
           ,[role_id]
           ,[abbr]
           ,[description])
     VALUES
           (146
           ,67
           ,1
           ,'SUBMITTED'
           ,'Submitted')

INSERT INTO [a_WF_TASK_OUTCOME]
           ([id]
           ,[task_id]
           ,[role_id]
           ,[abbr]
           ,[description])
     VALUES
           (147
           ,68
           ,7
           ,'IN PROC'
           ,'In Process')

INSERT INTO [a_WF_TASK_OUTCOME]
           ([id]
           ,[task_id]
           ,[role_id]
           ,[abbr]
           ,[description])
     VALUES
           (148
           ,68
           ,7
           ,'SUBMITTED'
           ,'Submitted')

INSERT INTO [a_WF_TASK_OUTCOME]
           ([id]
           ,[task_id]
           ,[role_id]
           ,[abbr]
           ,[description])
     VALUES
           (149
           ,69
           ,7
           ,'IN PROC'
           ,'In Process')

INSERT INTO [a_WF_TASK_OUTCOME]
           ([id]
           ,[task_id]
           ,[role_id]
           ,[abbr]
           ,[description])
     VALUES
           (150
           ,69
           ,7
           ,'SUBMITTED'
           ,'Submitted')

UPDATE s_ID_GEN
	SET next_id = 151
	WHERE table_name = 'a_WF_TASK_OUTCOME'
