INSERT INTO [a_STANDARD_FORMS]
           ([id]
           ,[form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path]
           ,[after_submit_control_path]
           ,[help_file_path]
           ,[is_client]
           ,[is_active])
     VALUES
           (1235
           ,1
           ,'LSC - Milestones Reporting'
           ,'LSC - Milestones Reporting'
           ,'Report'
           ,'LSC - Milestones Reporting'
           ,'Implementation/Modules/TIGMilestoneReport/Controls/Page/Main.ascx'
           ,'Implementation/Modules/TIGMilestoneReport/Controls/Page/PostSubmit.ascx'
           ,NULL
           ,1
           ,1)
           
INSERT INTO [a_STANDARD_FORM_RELATED_PAGE]
           ([id]
           ,[standard_form_id]
           ,[page_key]
           ,[page_title]
           ,[control_path])
     VALUES
           (1118
           ,1235
           ,'UploadRelated'
           ,'Milestone Uploads'
           ,'Implementation/Modules/TIGMilestoneReport/Controls/Page/Upload.ascx')

INSERT INTO [a_STANDARD_FORMS]
           ([id]
           ,[form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path]
           ,[after_submit_control_path]
           ,[help_file_path]
           ,[is_client]
           ,[is_active])
     VALUES
           (1236
           ,4
           ,'LSC - Milestones Reporting Review/Submit'
           ,'LSC - Milestones Reporting Review/Submit'
           ,'ReviewSubmit'
           ,'LSC - Milestones Reporting Review/Submit'
           ,'Implementation/Modules/TIGMilestoneReport/Controls/Page/ReviewSubmit.ascx'
           ,NULL
           ,NULL
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1237
	WHERE table_name = 'a_STANDARD_FORMS'

UPDATE s_ID_GEN
	SET next_id = 1119
	WHERE table_name = 'a_STANDARD_FORM_RELATED_PAGE'

