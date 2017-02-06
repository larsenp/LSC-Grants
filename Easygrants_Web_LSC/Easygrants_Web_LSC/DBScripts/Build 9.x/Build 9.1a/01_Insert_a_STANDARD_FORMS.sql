INSERT INTO [a_STANDARD_FORMS]
           ([id]
           ,[form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path]
		   ,[after_submit_control_path]
           ,[is_client]
           ,[is_active])
     VALUES
           (1293
           ,1
           ,'LSC - TIG - Grant Award Package'
           ,'TIG - Review Grant Award Package'
           ,'TIGGrantAwardPackage'
           ,'TIGGrantAwardPackage'
           ,'Implementation/Modules/TIG_GrantAwardPackage/Forms/Review.ascx'
           ,'Implementation/Modules/TIG_GrantAwardPackage/Forms/PostSubmission.ascx'
           ,1
           ,1)


UPDATE s_ID_GEN
	SET next_id = 1294
	WHERE table_name = 'a_STANDARD_FORMS'

