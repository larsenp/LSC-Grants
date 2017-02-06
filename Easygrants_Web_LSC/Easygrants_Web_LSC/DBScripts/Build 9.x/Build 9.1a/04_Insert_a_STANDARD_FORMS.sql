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
           (1296
           ,3
           ,'LSC - TIG - Grant Award Letter Upload'
           ,'TIG - Grant Award Letter Upload'
           ,'TIGGrantAwardLetterUpload'
           ,'TIG - Grant Award Letter Upload'
           ,'Implementation/Modules/TIG_GrantAwardLetterUpload/Forms/TIGGrantAwardLetter.ascx'
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
           (1297
           ,4
           ,'LSC - TIG - Grant Award Letter Upload - Review and Submit'
           ,'TIG - Grant Award Letter Upload - Review and Submit'
           ,'TIGGrantAwardLetterUploadReviewSubmit'
           ,'TIG - Grant Award Letter Upload - Review and Submit'
           ,'Implementation/Modules/TIG_GrantAwardLetterUpload/Forms/ReviewSubmit.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1298
	WHERE table_name = 'a_STANDARD_FORMS'




