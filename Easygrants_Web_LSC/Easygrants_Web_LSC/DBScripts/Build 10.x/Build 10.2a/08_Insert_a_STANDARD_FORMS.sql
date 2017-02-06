--Insert forms for President review of TIG LOIs

DECLARE @new_id INT

EXEC @new_id = getid_sel @table='a_STANDARD_FORMS', @mode = 2

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
           (@new_id
           ,1
           ,'LSC - TIG LOI Review - President'
           ,'LSC - TIG LOI Review - President'
           ,'Review'
           ,'President Review'
           ,'Implementation/Modules/TIG_LOI_Review/Forms/President/TIGLOIReview_President.ascx'
           ,'Implementation/Modules/TIG_LOI_Review/Forms/President/PostSubmission.ascx'
           ,1
           ,1)

EXEC @new_id = getid_sel @table='a_STANDARD_FORMS', @mode = 2

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
           (@new_id
           ,4
           ,'LSC - TIG LOI Review - President - Review and Submit'
           ,'LSC - TIG LOI Review - President - Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation/Modules/TIG_LOI_Review/Forms/President/ReviewSubmit.ascx'
           ,1
           ,1)
