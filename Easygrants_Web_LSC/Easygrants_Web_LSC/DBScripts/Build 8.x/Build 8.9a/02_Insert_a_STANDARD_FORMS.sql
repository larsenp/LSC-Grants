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
           (1277
           ,1
           ,'LSC - TIG Application Review - Website Renewal/Continuation - VP'
           ,'LSC - TIG Application Review - Website Renewal/Continuation - VP'
           ,'VPReview'
           ,'Vice President Review'
           ,'Implementation/Modules/TIG_ApplReview/Forms/Website_Renewal_Cont_VP/Review.ascx'
           ,1
           ,1
           ,'Implementation/Modules/TIG_ApplReview/Forms/Website_Renewal_Cont_VP/PostSubmission.ascx')

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
           (1278
           ,4
           ,'LSC - TIG Application Review - Website Renewal/Continuation - VP - Review and Submit'
           ,'TIG Application Review - Open/Replication/Website Improvement - VP Review  - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation\Modules\TIG_ApplReview\Forms\Website_Renewal_Cont_VP\ReviewSubmit.ascx'
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
           ,[is_active]
			,after_submit_control_path)
     VALUES
           (1279
           ,1
           ,'LSC - TIG Application Review - Website Renewal/Continuation - President'
           ,'LSC - TIG Application Review - Website Renewal/Continuation - President'
           ,'PresidentReview'
           ,'President Review'
           ,'Implementation/Modules/TIG_ApplReview/Forms/Website_Renewal_Cont_President/Review.ascx'
           ,1
           ,1
           ,'Implementation/Modules/TIG_ApplReview/Forms/Website_Renewal_Cont_President/PostSubmission.ascx')

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
           (1280
           ,4
           ,'LSC - TIG Application Review - Website Renewal/Continuation - President - Review and Submit'
           ,'TIG Application Review - Open/Replication/Website Improvement - President Review  - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation\Modules\TIG_ApplReview\Forms\Website_Renewal_Cont_President\ReviewSubmit.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1281
	WHERE table_name = 'a_STANDARD_FORMS'