INSERT INTO [a_STANDARD_FORM_RELATED_PAGE]
           ([id]
           ,[standard_form_id]
           ,[page_key]
           ,[page_title]
           ,[control_path])
     VALUES
           (1119
           ,1240
           ,'ReviewOPPOpenEditor'
           ,'TIG LOI Review - OPP - Open/Replication/Website Improvement - Scores and Comments'
           ,'Implementation/Modules/TIG_LOI_Review/Forms/OPP_ScoresComments_OpenReplication.ascx')


UPDATE s_ID_GEN
	SET next_id = 1120
	WHERE table_name = 'a_STANDARD_FORM_RELATED_PAGE'
