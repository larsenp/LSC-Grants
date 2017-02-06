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
           (1318
           ,1
           ,'LSC - TIG Application - Conflicts'
           ,'TIG Application - Conflicts'
           ,'Conflicts'
           ,'Conflicts'
           ,'Implementation/Modules/TIG_Application/Forms/Conflicts.ascx'
           ,1
           ,1)


UPDATE s_ID_GEN
	SET next_id = 1319
	WHERE table_name = 'a_STANDARD_FORMS'