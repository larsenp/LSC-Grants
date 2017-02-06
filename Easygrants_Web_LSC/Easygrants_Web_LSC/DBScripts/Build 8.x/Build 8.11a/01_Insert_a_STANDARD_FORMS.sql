INSERT INTO [a_STANDARD_FORMS]
           ([id]
           ,[form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path]
           ,[is_client]
           ,[is_active]
			,after_submit_control_path)
     VALUES
           (1290
           ,1
           ,'LSC - TIG - Revise Budget - Budget'
           ,'TIG - Revise Budget - Budget'
           ,'Budget'
           ,'Budget'
           ,'Implementation/Modules/TIG_ReviseBudget/Forms/Budget.ascx'
           ,1
           ,1
           ,'Implementation/Modules/TIG_ReviseBudget/Forms/PostSubmission.ascx')

UPDATE s_ID_GEN
	SET next_id = 1291
	WHERE table_name = 'a_STANDARD_FORMS'