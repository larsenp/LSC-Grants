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
           (1283
           ,3
           ,'LSC - Request Subgrant Approval - Main'
           ,'LSC - Request Subgrant Approval - Main'
           ,'Main'
           ,'Main'
           ,'Implementation/Modules/RequestSubgrantApproval/Forms/Main.ascx'
           ,1
           ,1
           ,'Implementation/Modules/RequestSubgrantApproval/Forms/PostSubmission.ascx')

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
           (1284
           ,1
           ,'LSC - Request Subgrant Approval - Subrecipient Profile'
           ,'LSC - Request Subgrant Approval - Subrecipient Profile'
           ,'SubrecipientProfile'
           ,'Subrecipient Profile'
           ,'Implementation/Modules/RequestSubgrantApproval/Forms/SubrecipientProfile.ascx'
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
           (1285
           ,4
           ,'LSC - Request Subgrant Approval - Review and Submit'
           ,'LSC - Request Subgrant Approval - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation/Modules/RequestSubgrantApproval/Forms/ReviewSubmit.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1286
	WHERE table_name = 'a_STANDARD_FORMS'
