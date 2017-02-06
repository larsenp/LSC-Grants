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
           (1281
           ,1
           ,'LSC - TIG Application Review - Open/Replication/Website Improvement - President Review'
           ,'TIG Application Review - Open/Replication/Website Improvement - President Review'
           ,'PresReview'
           ,'President Review'
           ,'Implementation/Modules/TIG_ApplReview/Forms/Open_Repl_WebImpr_President/ReviewSummary.ascx'
           ,1
           ,1
           ,'Implementation/Modules/TIG_ApplReview/Forms/Open_Repl_WebImpr_President/PostSubmission.ascx')

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
           (1282
           ,4
           ,'LSC - TIG Application Review - Open/Replication/Website Improvement - President Review and Submit'
           ,'TIG Application Review - Open/Replication/Website Improvement - President Review  - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation\Modules\TIG_ApplReview\Forms\Open_Repl_WebImpr_President\ReviewSubmit.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1283
	WHERE table_name = 'a_STANDARD_FORMS'