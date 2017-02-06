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
           (1320
           ,1
           ,'LSC - Review Subgrant Approval Request - OPP Staff - OPP Staff Review'
           ,'LSC - Review Subgrant Approval Request - OPP Staff - OPP Staff Review'
           ,'OPPStaffReview'
           ,'OPP Staff Review'
           ,'Implementation/Modules/SubgrantApprovalReview_OPPStaff/Forms/OPPStaffReview.ascx'
           ,'Implementation/Modules/SubgrantApprovalReview_OPPStaff/Forms/PostSubmission.ascx'
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
           (1321
           ,4
           ,'LSC - Review Subgrant Approval Request - OPP Staff - Review and Submit'
           ,'LSC - Review Subgrant Approval Request - OPP Staff - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation/Modules/SubgrantApprovalReview_OPPStaff/Forms/ReviewSubmit.ascx'
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
           (1322
           ,1
           ,'LSC - Review Subgrant Approval Request - OPP Director - OPP Director Review'
           ,'LSC - Review Subgrant Approval Request - OPP Director - OPP Director Review'
           ,'OPPDirectorReview'
           ,'OPP Director Review'
           ,'Implementation/Modules/SubgrantApprovalReview_OPPDir/Forms/OPPDirectorReview.ascx'
           ,'Implementation/Modules/SubgrantApprovalReview_OPPDir/Forms/PostSubmission.ascx'
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
           (1323
           ,4
           ,'LSC - Review Subgrant Approval Request - OPP Director - Review and Submit'
           ,'LSC - Review Subgrant Approval Request - OPP Director - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation/Modules/SubgrantApprovalReview_OPPDir/Forms/ReviewSubmit.ascx'
           ,1
           ,1)



UPDATE s_ID_GEN
	SET next_id = 1324
	WHERE table_name = 'a_STANDARD_FORMS'
