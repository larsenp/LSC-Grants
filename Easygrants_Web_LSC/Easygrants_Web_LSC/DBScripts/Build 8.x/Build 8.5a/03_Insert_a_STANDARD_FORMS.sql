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
           (1270
           ,1
           ,'LSC - TIG Application Review - Website Renewal/Continuation'
           ,'LSC - TIG Application Review - Website Renewal/Continuation'
           ,'Review'
           ,'TIG Application Review - Website Renewal/Continuation'
           ,'Implementation/Modules/TIG_ApplReview/Forms/Website_Renewal_Cont/InternalReview.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1271
	WHERE table_name = 'a_STANDARD_FORMS'
