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
           (1286
           ,1
           ,'LSC - Request Subgrant Approval - Subrecipient Budget'
           ,'LSC - Request Subgrant Approval - Subrecipient Budget'
           ,'SubrecipientBudget'
           ,'Subrecipient Budget'
           ,'Implementation/Modules/RequestSubgrantApproval/Forms/SubrecipientBudget.ascx'
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
           (1287
           ,1
           ,'LSC - Request Subgrant Approval - Subgrant Summary'
           ,'LSC - Request Subgrant Approval - Subgrant Summary'
           ,'SubgrantSummary'
           ,'Subgrant Summary'
           ,'Implementation/Modules/RequestSubgrantApproval/Forms/SubgrantSummary.ascx'
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
           (1288
           ,1
           ,'LSC - Request Subgrant Approval - Subgrant Agreement Index'
           ,'LSC - Request Subgrant Approval - Subgrant Agreement Index'
           ,'SubgrantAgreementIndex'
           ,'Subgrant Agreement Index'
           ,'Implementation/Modules/RequestSubgrantApproval/Forms/SubgrantAgreementIndex.ascx'
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
           (1289
           ,1
           ,'LSC - Request Subgrant Approval - Uploads'
           ,'LSC - Request Subgrant Approval - Uploads'
           ,'Uploads'
           ,'Uploads'
           ,'Implementation/Modules/RequestSubgrantApproval/Forms/Uploads.ascx'
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
           (1290
           ,1
           ,'LSC - Request Subgrant Approval - Upload Editor'
           ,'LSC - Request Subgrant Approval - Upload Editor'
           ,'UploadEditor'
           ,'Upload Editor'
           ,'Implementation/Modules/RequestSubgrantApproval/Forms/UploadEditor.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1291
	WHERE table_name = 'a_STANDARD_FORMS'
