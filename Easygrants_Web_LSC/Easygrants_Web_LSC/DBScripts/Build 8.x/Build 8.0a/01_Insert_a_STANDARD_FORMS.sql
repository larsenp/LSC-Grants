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
           (1237
           ,1
           ,'LSC - TIG LOI Open/Replication'
           ,'LSC - TIG LOI Open/Replication'
           ,'OpenReplication'
           ,'TIG Letter of Intent'
           ,'Implementation/Modules/TIG_LOI/Forms/OpenReplication.ascx'
           ,'Implementation/Modules/TIG_LOI/Forms/OpenReplication_PostSubmit.ascx'
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
           ,[after_submit_control_path]
           ,[is_client]
           ,[is_active])
     VALUES
           (1238
           ,1
           ,'LSC - TIG LOI Renewal/Continuation Web Sites'
           ,'LSC - TIG LOI Renewal/Continuation Web Sites'
           ,'WebSites'
           ,'TIG Letter of Intent'
           ,'Implementation/Modules/TIG_LOI/Forms/WebSite.ascx'
           ,'Implementation/Modules/TIG_LOI/Forms/WebSite_PostSubmit.ascx'
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
           (1239
           ,4
           ,'LSC - TIG LOI Review and Submit'
           ,'LSC - TIG LOI Review and Submit'
           ,'ReviewSubmit'
           ,'TIG Letter of Intent Review and Submit'
           ,'Implementation/Modules/TIG_LOI/Forms/ReviewSubmit.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1240
	WHERE table_name = 'a_STANDARD_FORMS'
