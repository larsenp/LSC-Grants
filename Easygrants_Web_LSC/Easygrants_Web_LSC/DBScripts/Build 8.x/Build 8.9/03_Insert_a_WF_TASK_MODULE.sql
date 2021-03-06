INSERT INTO [dbo].[a_WF_TASK_MODULE]
           ([wf_task_module_id]
           ,[wf_task_id]
           ,[wf_task_role_id]
           ,[module_name]
           ,[module_config_filename]
           ,[outcome_config_filename])
     VALUES
           (59
           ,47
           ,7 --- reviewer
           ,'ApplReview_OPPDir'
           ,'ApplReviewModule_OPPDirConfig'
           ,'ApplReviewOutcome_OPPDirConfig')


INSERT INTO [dbo].[a_WF_TASK_MODULE]
           ([wf_task_module_id]
           ,[wf_task_id]
           ,[wf_task_role_id]
           ,[module_name]
           ,[module_config_filename]
           ,[outcome_config_filename])
     VALUES
           (60
           ,52
           ,7 --- reviewer
           ,'RenewalReview_OPPDir'
           ,'RenewalReviewModule_OPPDirConfig'
           ,'RenewalReviewOutcome_OPPDirConfig')

update s_id_gen
	set next_id = 61
	where table_name = 'a_WF_TASK_MODULE'