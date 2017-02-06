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
           (1275
           ,1
           ,'LSC - TIG Application Review - Website Renewal/Continuation - OPP Director'
           ,'LSC - TIG Application Review - Website Renewal/Continuation - OPP Director'
           ,'OPPDirReview'
           ,'OPP Director Review'
           ,'Implementation/Modules/TIG_ApplReview/Forms/Website_Renewal_Cont_OPPDir/Review.ascx'
           ,1
           ,1
           ,'Implementation/Modules/TIG_ApplReview/Forms/Website_Renewal_Cont_OPPDir/PostSubmission.ascx')

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
           (1276
           ,4
           ,'LSC - TIG Application Review - Website Renewal/Continuation - OPP Director - Review and Submit'
           ,'TIG Application Review - Open/Replication/Website Improvement - OPP Director Review  - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation\Modules\TIG_ApplReview\Forms\Website_Renewal_Cont_OPPDir\ReviewSubmit.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1277
	WHERE table_name = 'a_STANDARD_FORMS'