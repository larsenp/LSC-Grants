
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
           (1324
           ,1
           ,'LSC - Review Subgrant Approval Request - OCE Director - OCE Director Review'
           ,'LSC - Review Subgrant Approval Request - OCE Director - OCE Director Review'
           ,'OCEDirectorReview'
           ,'OCE Director Review'
           ,'Implementation/Modules/SubgrantApprovalReview_OCEDir/Forms/OCEDirectorReview.ascx'
           ,'Implementation/Modules/SubgrantApprovalReview_OCEDir/Forms/PostSubmission.ascx'
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
           (1325
           ,4
           ,'LSC - Review Subgrant Approval Request - OCE Director - Review and Submit'
           ,'LSC - Review Subgrant Approval Request - OCE Director - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation/Modules/SubgrantApprovalReview_OCEDir/Forms/ReviewSubmit.ascx'
           ,1
           ,1)



UPDATE s_ID_GEN
	SET next_id = 1326
	WHERE table_name = 'a_STANDARD_FORMS'
