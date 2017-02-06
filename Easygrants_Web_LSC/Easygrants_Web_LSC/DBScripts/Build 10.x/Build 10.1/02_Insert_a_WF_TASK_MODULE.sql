INSERT INTO [a_WF_TASK_MODULE]
           ([wf_task_module_id]
           ,[wf_task_id]
           ,[wf_task_role_id]
           ,[module_name]
           ,[module_config_filename]
           ,[outcome_config_filename])
     VALUES
           (73
           ,66
           ,1
           ,'Application'
           ,'PostPQVCompApplModuleConfig'
           ,'PostPQVCompApplOutcomeConfig')

INSERT INTO [a_WF_TASK_MODULE]
           ([wf_task_module_id]
           ,[wf_task_id]
           ,[wf_task_role_id]
           ,[module_name]
           ,[module_config_filename]
           ,[outcome_config_filename])
     VALUES
           (74
           ,67
           ,1
           ,'Application'
           ,'PostPQVRenewApplModuleConfig'
           ,'PostPQVRenewApplOutcomeConfig')

UPDATE s_ID_GEN
	SET next_id = 75
	WHERE table_name = 'a_WF_TASK_MODULE'
