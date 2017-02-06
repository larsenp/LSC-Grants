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
           (1332
           ,1
           ,'LSC - TIG Application - Draft Evaluation Plan'
           ,'TIG Application - Draft Evaluation Plan'
           ,'EvaluationPlan'
           ,'Evaluation Plan'
           ,'Implementation/Modules/TIG_Application/Forms/EvaluationPlan.ascx'
           ,1
           ,1)



UPDATE s_ID_GEN
	SET next_id = 1333
	WHERE table_name = 'a_STANDARD_FORMS'
