--Upload form
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
           (1310
           ,2
           ,'LSC - Request Subgrant Modification - Upload'
           ,'LSC - Request Subgrant Modification - Upload'
           ,'Upload'
           ,'Upload'
           ,'Implementation/Modules/RequestSubgrantModification/Forms/Upload.ascx'
           ,'Implementation/Modules/RequestSubgrantModification/Forms/PostSubmission.ascx'
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
           (1311
           ,4
           ,'LSC - Request Subgrant Modification - Review and Submit'
           ,'LSC - Request Subgrant Modification - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation/Modules/RequestSubgrantModification/Forms/ReviewSubmit.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1312
	WHERE table_name = 'a_STANDARD_FORMS'

