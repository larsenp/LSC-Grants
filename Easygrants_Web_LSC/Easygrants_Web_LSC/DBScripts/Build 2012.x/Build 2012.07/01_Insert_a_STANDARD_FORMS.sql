INSERT INTO [a_STANDARD_FORMS]
           ([id]
           ,[form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path]
           ,[is_client]
           ,[is_active])
     VALUES
           (1319
           ,1
           ,'LSC - TIG Application Review - Open/Replication/Website Improvement - Conflicts'
           ,'TIG Application Review - Open/Replication/Website Improvement - Conflicts'
           ,'Conflicts'
           ,'Conflicts'
           ,'Implementation/Modules/TIG_ApplReview/Forms/Open_Repl_WebImpr/Conflicts.ascx'
           ,1
           ,1)


UPDATE s_ID_GEN
	SET next_id = 1320
	WHERE table_name = 'a_STANDARD_FORMS'