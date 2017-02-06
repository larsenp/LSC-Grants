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
           (1273
           ,1
           ,'LSC - TIG Application Review - Open/Replication/Website Improvement - VP Review'
           ,'TIG Application Review - Open/Replication/Website Improvement - VP Review'
           ,'VPReview'
           ,'VP Review'
           ,'Implementation/Modules/TIG_ApplReview/Forms/Open_Repl_WebImpr_VP/ReviewSummary.ascx'
           ,1
           ,1
           ,'Implementation/Modules/TIG_ApplReview/Forms/Open_Repl_WebImpr_VP/PostSubmission.ascx')

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
           (1274
           ,4
           ,'LSC - TIG Application Review - Open/Replication/Website Improvement - VP Review and Submit'
           ,'TIG Application Review - Open/Replication/Website Improvement - VP Review  - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation\Modules\TIG_ApplReview\Forms\Open_Repl_WebImpr_VP\ReviewSubmit.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1275
	WHERE table_name = 'a_STANDARD_FORMS'