INSERT INTO [dbo].[a_WF_TASK]
           ([id]
           ,[abbr]
           ,[description]
           ,[wf_task_type_id]
           ,[sort_order]
           ,[is_copy_allowed])
     VALUES
           (47
           ,'Submit Application Review - OPP Director'
           ,'Submit Application Review - OPP Director'
           ,4
           ,7
           ,2)


INSERT INTO [dbo].[a_WF_TASK]
           ([id]
           ,[abbr]
           ,[description]
           ,[wf_task_type_id]
           ,[sort_order]
           ,[is_copy_allowed])
     VALUES
           (52
           ,'Submit Renewal Review - OPP Director'
           ,'Submit Renewal Review - OPP Director'
           ,4
           ,8
           ,2)

update s_id_gen
	set next_id = 53
	where table_name = 'a_WF_TASK'