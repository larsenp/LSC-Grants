--Letters of Commitment from Key Partners
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
           (1255
           ,1
           ,'LSC - TIG Application - Letters of Commitment from Key Partners'
           ,'TIG Application - Letters of Commitment from Key Partners'
           ,'LettersOfCommitment'
           ,'Letters of Commitment from Key Partners'
           ,'Implementation/Modules/TIG_Application/Forms/LettersOfCommitment.ascx'
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
           (1256
           ,1
           ,'LSC - TIG Application - Application (Website Continuation/Renewal)'
           ,'TIG Application - Application (Website Continuation/Renewal)'
           ,'Application'
           ,'Application'
           ,'Implementation/Modules/TIG_Application/Forms/Application_ContRenewal.ascx'
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
           (1257
           ,1
           ,'LSC - TIG Application - Website Questionnaire'
           ,'TIG Application - Website Questionnaire'
           ,'WebsiteQuestionnaire'
           ,'Website Questionnaire'
           ,'Implementation/Modules/TIG_Application/Forms/WebsiteQuestionnaire.ascx'
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
           (1258
           ,1
           ,'LSC - TIG Application - Payment Schedule'
           ,'TIG Application - Payment Schedule'
           ,'PaymentSchedule'
           ,'Payment Schedule'
           ,'Implementation/Modules/TIG_Application/Forms/PaymentSchedule.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1259
	WHERE table_name = 'a_STANDARD_FORMS'
