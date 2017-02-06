declare @standard_form_id int

exec getid_sel @table = 'a_STANDARD_FORMS', @id = @standard_form_id OUTPUT, @mode = 2

INSERT a_STANDARD_FORMS
           ([id]
            ,[form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path]
           ,[after_submit_control_path])
		   Values
		   (@standard_form_id
		   ,1
           ,'LSC - PBIF Application - Contracts'
           ,'Contracts'
           ,'Contracts'
           ,'Contracts'
           ,'Implementation/Modules/PBIF_Application/Forms/Contracts.ascx'
           ,'Implementation/Modules/PBIF_Application/Forms/Contracts.ascx')

exec getid_sel @table = 'a_STANDARD_FORMS', @id = @standard_form_id OUTPUT, @mode = 2

INSERT a_STANDARD_FORMS
           ([id]
            ,[form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path]
           ,[after_submit_control_path])
		   Values
		   (@standard_form_id
		   ,1
           ,'LSC - PBIF Application - Subgrants'
           ,'Subgrants'
           ,'Subgrants'
           ,'Subgrants'
           ,'Implementation/Modules/PBIF_Application/Forms/Subgrants.ascx'
           ,'Implementation/Modules/PBIF_Application/Forms/Subgrants.ascx')

INSERT INTO a_UPLOAD(upload_id , upload_name ,allowed_file_extensions) VALUES (64,'Contracts','.doc, .pdf, .rtf, .docx, .xls, .xlsx')
INSERT INTO a_UPLOAD(upload_id , upload_name ,allowed_file_extensions) VALUES (65,'Subgrants','.doc, .pdf, .rtf, .docx, .xls, .xlsx')