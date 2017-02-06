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
           (1240
           ,1
           ,'LSC - TIG LOI Review - Open - OPP'
           ,'LSC - TIG LOI Review - Open/Replication/Website Improvement - OPP'
           ,'ReviewOPPOpen'
           ,'TIG LOI Review - Open/Replication/Website Improvement - OPP'
           ,'Implementation/Modules/TIG_LOI_Review/Forms/TIGLOIReview_OPP_List.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1241
	WHERE table_name = 'a_STANDARD_FORMS'
