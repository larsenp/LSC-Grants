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
           (1241
           ,1
           ,'LSC - TIG LOI Review - Websites - OPP'
           ,'LSC - TIG LOI Review - Continuation/Renewal Websites - OPP'
           ,'ReviewOPPWebsites'
           ,'TIG LOI Review - Continuation/Renewal Websites - OPP'
           ,'Implementation/Modules/TIG_LOI_Review/Forms/TIGLOIReview_OPP_Container_WebRenewalContinuation.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1242
	WHERE table_name = 'a_STANDARD_FORMS'

INSERT INTO [a_STANDARD_FORM_RELATED_PAGE]
           ([id]
           ,[standard_form_id]
           ,[page_key]
           ,[page_title]
           ,[control_path])
     VALUES
           (1120
           ,1241
           ,'ReviewOPPWebsitesEditor'
           ,'TIG LOI Review - OPP - Continuation/Renewal Website - Scores and Comments'
           ,'Implementation/Modules/TIG_LOI_Review/Forms/OPP_ScoresComments_WebRenewalContinuation.ascx')


UPDATE s_ID_GEN
	SET next_id = 1121
	WHERE table_name = 'a_STANDARD_FORM_RELATED_PAGE'
