INSERT INTO [dbo].[a_WF_TASK]
           ([id]
           ,[abbr]
           ,[description]
           ,[wf_task_type_id]
           ,[sort_order]
           ,[is_copy_allowed])
     VALUES
           (56
           ,'Submit Application Review - President'
           ,'Submit Application Review - President'
           ,4
           ,9
           ,2)


INSERT INTO [dbo].[a_WF_TASK]
           ([id]
           ,[abbr]
           ,[description]
           ,[wf_task_type_id]
           ,[sort_order]
           ,[is_copy_allowed])
     VALUES
           (57
           ,'Submit Renewal Review - President'
           ,'Submit Renewal Review - President'
           ,4
           ,10
           ,2)

update s_id_gen
	set next_id = 58
	where table_name = 'a_WF_TASK'