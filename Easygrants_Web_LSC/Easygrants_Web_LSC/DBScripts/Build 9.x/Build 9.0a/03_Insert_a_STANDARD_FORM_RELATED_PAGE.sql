INSERT INTO [a_STANDARD_FORM_RELATED_PAGE]
           ([id]
           ,[standard_form_id]
           ,[page_key]
           ,[page_title]
           ,[control_path])
     VALUES
           (1122
           ,1289
           ,'UploadEditor'
           ,'Upload Editor'
           ,'Implementation/Modules/RequestSubgrantApproval/Forms/UploadEditor.ascx')

UPDATE s_ID_GEN
	SET next_id = 1123
	WHERE table_name = 'a_STANDARD_FORM_RELATED_PAGE'

DELETE a_STANDARD_FORMS --This control was at first mistakenly added to a_STANDARD_FORMS.
	WHERE id = 1290
