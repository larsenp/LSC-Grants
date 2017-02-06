DECLARE @new_id INT

EXEC @new_id = getid_sel @table='a_STANDARD_FORMS', @mode = 2

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
           (@new_id
           ,1
           ,'LSC - TIG - Submit Final Budget - Budget'
           ,'LSC - TIG - Submit Final Budget - Budget'
           ,'FinalBudget'
           ,'Final Budget'
           ,'Implementation/Modules/TIG_FinalBudget/Forms/FinalBudget.ascx'
           ,1
           ,1)

EXEC @new_id = getid_sel @table='a_STANDARD_FORMS', @mode = 2

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
           (@new_id
           ,4
           ,'LSC - TIG - Submit Final Budget - Review and Submit'
           ,'LSC - TIG - Submit Final Budget - Review and Submit'
           ,'Review and Submit'
           ,'Review and Submit'
           ,'Implementation/Modules/TIG_FinalBudget/Forms/ReviewSubmit.ascx'
           ,1
           ,1)

EXEC @new_id = getid_sel @table='a_STANDARD_FORMS', @mode = 2

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
           (@new_id
           ,1
           ,'LSC - TIG - Submit Final Budget - Explanation of Variances'
           ,'LSC - TIG - Submit Final Budget - Explanation of Variances'
           ,'BudgetVariances'
           ,'Explanation of Variance of Budget Items'
           ,'Implementation/Modules/TIG_FinalBudget/Forms/Variances.ascx'
           ,1
           ,1)

