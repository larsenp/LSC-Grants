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
           (1312
           ,1
           ,'LSC - TIG - Revise Budget and Payment Schedule - Budget'
           ,'LSC - TIG - Revise Budget and Payment Schedule - Budget'
           ,'Budget'
           ,'Budget'
           ,'Implementation/Modules/TIG_ReviseBudget/Forms/Budget_Applicant.ascx'
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
           (1313
           ,1
           ,'LSC - TIG - Revise Budget and Payment Schedule - Budget Narrative'
           ,'LSC - TIG - Revise Budget and Payment Schedule - Budget Narrative'
           ,'Budget Narrative'
           ,'Budget Narrative'
           ,'Implementation/Modules/TIG_ReviseBudget/Forms/BudgetNarrative_Applicant.ascx'
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
           (1314
           ,1
           ,'LSC - TIG - Revise Budget and Payment Schedule - Payment Schedule'
           ,'LSC - TIG - Revise Budget and Payment Schedule - Payment Schedule'
           ,'PaymentSchedule'
           ,'Payment Schedule'
           ,'Implementation/Modules/TIG_RevisePaymentSchedule/Forms/ProposedPaymentSchedule_Applicant.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1315
	WHERE table_name = 'a_STANDARD_FORMS'
