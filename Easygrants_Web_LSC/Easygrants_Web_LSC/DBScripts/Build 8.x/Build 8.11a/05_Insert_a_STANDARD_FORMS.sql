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
           (1292
           ,1
           ,'LSC - TIG - Revise Payment Schedule - Review and Submit'
           ,'TIG - Revise Payment Schedule - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation/Modules/TIG_RevisePaymentSchedule/Forms/ReviewSubmit.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1293
	WHERE table_name = 'a_STANDARD_FORMS'