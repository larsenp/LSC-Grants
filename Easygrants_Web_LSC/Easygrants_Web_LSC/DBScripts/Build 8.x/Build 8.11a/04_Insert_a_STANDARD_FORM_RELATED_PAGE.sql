INSERT INTO [a_STANDARD_FORM_RELATED_PAGE]
           ([id]
           ,[standard_form_id]
           ,[page_key]
           ,[page_title]
           ,[control_path])
     VALUES
           (1123
           ,1291
           ,'MilestoneEditor'
           ,'Milestone Editor'
           ,'Implementation/Modules/Staff/Controls/PageSection/MilestoneEditor.ascx')

UPDATE s_ID_GEN
	SET next_id = 1124
	WHERE table_name = 'a_STANDARD_FORM_RELATED_PAGE'

