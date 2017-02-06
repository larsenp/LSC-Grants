--Main
INSERT INTO [a_STANDARD_FORMS]
           ([id]
           ,[form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path]
           ,[after_submit_control_path]
           ,[is_client]
           ,[is_active])
     VALUES
           (1242
           ,3
           ,'LSC - TIG Application - Main'
           ,'TIG Application - Main'
           ,'Main'
           ,'Main'
           ,'Implementation/Modules/TIG_Application/Forms/Main.ascx'
           ,'Implementation/Modules/TIG_Application/Forms/PostSubmission.ascx'
           ,1
           ,1)

--Prior TIG Awards
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
           (1243
           ,1
           ,'LSC - TIG Application - Prior TIG Awards'
           ,'TIG Application - Prior TIG Awards'
           ,'PriorTIGAwards'
           ,'Prior TIG Awards'
           ,'Implementation/Modules/TIG_Application/Forms/PriorTIGAwards.ascx'
           ,1
           ,1)

--Other Projects
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
           (1244
           ,1
           ,'LSC - TIG Application - Other Projects'
           ,'TIG Application - Other Projects'
           ,'OtherProjects'
           ,'Other Projects'
           ,'Implementation/Modules/TIG_Application/Forms/OtherProjects.ascx'
           ,1
           ,1)

--Budget
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
           (1246
           ,1
           ,'LSC - TIG Application - Budget'
           ,'TIG Application - Budget'
           ,'Budget'
           ,'Budget'
           ,'Implementation/Modules/TIG_Application/Forms/Budget.ascx'
           ,1
           ,1)

--Budget Narrative
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
           (1247
           ,1
           ,'LSC - TIG Application - Budget Narrative'
           ,'TIG Application - Budget Narrative'
           ,'BudgetNarrative'
           ,'Budget Narrative'
           ,'Implementation/Modules/TIG_Application/Forms/BudgetNarrative.ascx'
           ,1
           ,1)

--Project Narrative
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
           (1248
           ,1
           ,'LSC - TIG Application - Project Narrative'
           ,'TIG Application - Project Narrative'
           ,'ProjectNarrative'
           ,'Project Narrative'
           ,'Implementation/Modules/TIG_Application/Forms/ProjectNarrative.ascx'
           ,1
           ,1)

--Project Narrative Appendices
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
           (1249
           ,1
           ,'LSC - TIG Application - Project Narrative Appendices'
           ,'TIG Application - Project Narrative Appendices'
           ,'ProjectNarrativeAppendices'
           ,'Project Narrative Appendices'
           ,'Implementation/Modules/TIG_Application/Forms/ProjectNarrativeAppendices.ascx'
           ,1
           ,1)

--Proposed Payment Schedule
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
           (1250
           ,1
           ,'LSC - TIG Application - Proposed Payment Schedule'
           ,'TIG Application - Proposed Payment Schedule'
           ,'ProposedPaymentSchedule'
           ,'Proposed Payment Schedule'
           ,'Implementation/Modules/TIG_Application/Forms/ProposedPaymentSchedule.ascx'
           ,1
           ,1)

--Proposed Payment Editor
INSERT INTO [a_STANDARD_FORM_RELATED_PAGE]
           ([id]
           ,[standard_form_id]
           ,[page_key]
           ,[page_title]
           ,[control_path])
     VALUES
           (1121
           ,1250
           ,'ProposedPaymentEditor'
           ,'Proposed Payment Editor'
           ,'Implementation/Modules/TIG_Application/Forms/ProposedPaymentEditor.ascx')

--Statement of Additional Funds
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
           (1251
           ,1
           ,'LSC - TIG Application - Statement of Additional Funds'
           ,'TIG Application - Statement of Additional Funds'
           ,'StatementOfAdditionalFunds'
           ,'Statement of Additional Funds'
           ,'Implementation/Modules/TIG_Application/Forms/StatementOfAdditionalFunds.ascx'
           ,1
           ,1)

--Letters of Support
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
           (1252
           ,1
           ,'LSC - TIG Application - Letters of Support'
           ,'TIG Application - Letters of Support'
           ,'LettersOfSupport'
           ,'Letters of Support'
           ,'Implementation/Modules/TIG_Application/Forms/LettersOfSupport.ascx'
           ,1
           ,1)

--Review and Submit
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
           (1253
           ,4
           ,'LSC - TIG Application - Review and Submit'
           ,'TIG Application - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation/Modules/TIG_Application/Forms/ReviewSubmit.ascx'
           ,1
           ,1)

--Application
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
           (1254
           ,1
           ,'LSC - TIG Application - Application'
           ,'TIG Application - Application'
           ,'Application'
           ,'Application'
           ,'Implementation/Modules/TIG_Application/Forms/Application.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1122
	WHERE table_name = 'a_STANDARD_FORM_RELATED_PAGE'

UPDATE s_ID_GEN
	SET next_id = 1255
	WHERE table_name = 'a_STANDARD_FORMS'
