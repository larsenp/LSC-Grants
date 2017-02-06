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
           (1291
           ,1
           ,'LSC - TIG - Revise Payment Schedule - Payment Schedule'
           ,'TIG - Revise Payment Schedule - Payment Schedule'
           ,'PaymentSchedule'
           ,'Payment Schedule'
           ,'Implementation/Modules/TIG_RevisePaymentSchedule/Forms/ProposedPaymentSchedule.ascx'
           ,1
           ,1
           ,'Implementation/Modules/TIG_RevisePaymentSchedule/Forms/PostSubmission.ascx')

UPDATE s_ID_GEN
	SET next_id = 1292
	WHERE table_name = 'a_STANDARD_FORMS'