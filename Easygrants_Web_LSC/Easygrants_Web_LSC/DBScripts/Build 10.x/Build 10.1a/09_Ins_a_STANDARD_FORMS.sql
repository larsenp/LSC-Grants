--Insert forms for OPP Director review of TIG LOIs
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
           (1304
           ,1
           ,'LSC - TIG LOI Review - OPP Director'
           ,'LSC - TIG LOI Review - OPP Director'
           ,'Review'
           ,'OPP Director Review'
           ,'Implementation/Modules/TIG_LOI_Review/Forms/OPPDirector/TIGLOIReview_OPPDir.ascx'
           ,'Implementation/Modules/TIG_LOI_Review/Forms/OPPDirector/PostSubmission.ascx'
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
           (1305
           ,4
           ,'LSC - TIG LOI Review - OPP Director - Review and Submit'
           ,'LSC - TIG LOI Review - OPP Director - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation/Modules/TIG_LOI_Review/Forms/OPPDirector/ReviewSubmit.ascx'
           ,1
           ,1)

--Insert new form for staff review of TIG LOIs
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
           (1306
           ,1
           ,'LSC - TIG LOI Review - O/R/WI - OPP'
           ,'LSC - TIG LOI Review - Open/Replication/Website Improvement - OPP'
           ,'Review_O_R_WI'
           ,'TIG LOI Review - Open/Replication/Website Improvement - OPP'
           ,'Implementation/Modules/TIG_LOI_Review/Forms/OPP_ScoresComments_OpenReplication.ascx'
           ,1
           ,1)

UPDATE s_ID_GEN
	SET next_id = 1307
	WHERE table_name = 'a_STANDARD_FORMS'

