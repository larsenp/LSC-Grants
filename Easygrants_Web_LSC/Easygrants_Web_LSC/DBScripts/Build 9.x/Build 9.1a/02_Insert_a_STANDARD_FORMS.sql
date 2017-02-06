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
           (1294
           ,1
           ,'LSC - TIG - Revise Budget - Budget Narrative'
           ,'TIG - Revise Budget - Budget Narrative'
           ,'TIGReviseBudgetBudgetNarrative'
           ,'TIG - Revise Budget - Budget Narrative'
           ,'Implementation/Modules/TIG_ReviseBudget/Forms/BudgetNarrative.ascx'
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
           (1295
           ,4
           ,'LSC - TIG - Revise Budget - Review and Submit'
           ,'TIG - Revise Budget - Review and Submit'
           ,'TIGReviseBudgetReviewSubmit'
           ,'TIG - Revise Budget - Review and Submit'
           ,'Implementation/Modules/TIG_ReviseBudget/Forms/ReviewSubmit.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1296
	WHERE table_name = 'a_STANDARD_FORMS'

