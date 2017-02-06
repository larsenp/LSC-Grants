INSERT INTO [dbo].[a_WF_TASK_MODULE]
           ([wf_task_module_id]
           ,[wf_task_id]
           ,[wf_task_role_id]
           ,[module_name]
           ,[module_config_filename]
           ,[outcome_config_filename])
     VALUES
           (64
           ,56
           ,7 --- reviewer
           ,'ApplReview_President'
           ,'ApplReviewModule_PresidentConfig'
           ,'ApplReviewOutcome_PresidentConfig')


INSERT INTO [dbo].[a_WF_TASK_MODULE]
           ([wf_task_module_id]
           ,[wf_task_id]
           ,[wf_task_role_id]
           ,[module_name]
           ,[module_config_filename]
           ,[outcome_config_filename])
     VALUES
           (65
           ,57
           ,7 --- reviewer
           ,'RenewalReview_President'
           ,'RenewalReviewModule_PresidentConfig'
           ,'RenewalReviewOutcome_PresidentConfig')

update s_id_gen
	set next_id = 66
	where table_name = 'a_WF_TASK_MODULE'