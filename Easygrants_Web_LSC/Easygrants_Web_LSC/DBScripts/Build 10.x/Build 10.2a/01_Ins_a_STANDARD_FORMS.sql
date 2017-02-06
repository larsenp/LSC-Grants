--Insert review/submit form for staff review of TIG LOIs
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
           (1307
           ,4
           ,'LSC - TIG LOI Review - Staff - Review and Submit'
           ,'LSC - TIG LOI Review - Staff - Review and Submit'
           ,'ReviewSubmit'
           ,'OPP Director Review and Submit'
           ,'Implementation/Modules/TIG_LOI_Review/Forms/ReviewSubmit.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1308
	WHERE table_name = 'a_STANDARD_FORMS'

