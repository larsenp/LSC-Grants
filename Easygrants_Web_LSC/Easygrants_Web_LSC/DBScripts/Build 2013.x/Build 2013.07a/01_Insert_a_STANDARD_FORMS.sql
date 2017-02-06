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
           (1328
           ,1
           ,'LSC - TIG LOI Review - Vice President'
           ,'LSC - TIG LOI Review - Vice President'
           ,'VicePresidentReview'
           ,'Vice President Review'
           ,'Implementation/Modules/TIG_LOI_Review/Forms/VicePresident/TIGLOIReview_VicePresident.ascx'
           ,'Implementation/Modules/TIG_LOI_Review/Forms/VicePresident/PostSubmission.ascx'
           ,1
           ,1)


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
           (1329
           ,4
           ,'LSC - TIG LOI Review - Vice President - Review and Submit'
           ,'LSC - TIG LOI Review - Vice President - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation/Modules/TIG_LOI_Review/Forms/VicePresident/ReviewSubmit.ascx'
           ,1
           ,1)





UPDATE s_ID_GEN
	SET next_id = 1330
	WHERE table_name = 'a_STANDARD_FORMS'
