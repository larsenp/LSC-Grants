--Insert forms for Deputy Director review
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
           (1302
           ,1
           ,'LSC - Review Subgrant Approval Request - Deputy Director - Deputy Director Review'
           ,'LSC - Review Subgrant Approval Request - Deputy Director - Deputy Director Review'
           ,'DeputyDirectorReview'
           ,'Deputy Director Review'
           ,'Implementation/Modules/SubgrantApprovalReview_DD/Forms/DeputyDirectorReview.ascx'
           ,'Implementation/Modules/SubgrantApprovalReview_DD/Forms/PostSubmission.ascx'
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
           (1303
           ,4
           ,'LSC - Review Subgrant Approval Request - Deputy Director - Review and Submit'
           ,'LSC - Review Subgrant Approval Request - Deputy Director - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation/Modules/SubgrantApprovalReview_DD/Forms/ReviewSubmit.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1304
	WHERE table_name = 'a_STANDARD_FORMS'

