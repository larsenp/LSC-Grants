--Insert forms for AA review
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
           (1298
           ,3
           ,'LSC - Review Subgrant Approval Request - AA - Main'
           ,'LSC - Review Subgrant Approval Request - AA - Main'
           ,'Main'
           ,'Main'
           ,'Implementation/Modules/SubgrantApprovalReview_AA/Forms/Main.ascx'
           ,'Implementation/Modules/SubgrantApprovalReview_AA/Forms/PostSubmission.ascx'
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
           (1299
           ,1
           ,'LSC - Review Subgrant Approval Request - AA - Subrecipient Number'
           ,'LSC - Review Subgrant Approval Request - AA - Subrecipient Number'
           ,'SubrecipientNumber'
           ,'Subrecipient Number'
           ,'Implementation/Modules/SubgrantApprovalReview_AA/Forms/SubrecipientNumber.ascx'
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
           (1300
           ,1
           ,'LSC - Review Subgrant Approval Request - AA - Subgrant Agreement Index'
           ,'LSC - Review Subgrant Approval Request - AA - Subgrant Agreement Index'
           ,'SubgrantAgreementIndex'
           ,'Subgrant Agreement Index'
           ,'Implementation/Modules/SubgrantApprovalReview_AA/Forms/SubgrantAgreementIndex.ascx'
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
           (1301
           ,4
           ,'LSC - Review Subgrant Approval Request - AA - Review and Submit'
           ,'LSC - Review Subgrant Approval Request - AA - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation/Modules/SubgrantApprovalReview_AA/Forms/ReviewSubmit.ascx'
           ,1
           ,1)


UPDATE s_ID_GEN
	SET next_id = 1302
	WHERE table_name = 'a_STANDARD_FORMS'

