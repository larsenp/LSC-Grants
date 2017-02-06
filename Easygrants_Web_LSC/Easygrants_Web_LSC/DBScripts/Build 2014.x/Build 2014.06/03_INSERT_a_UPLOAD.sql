



INSERT INTO a_UPLOAD(upload_id , upload_name ,allowed_file_extensions) VALUES (61,'Budget Narrative','.doc, .pdf, .rtf, .docx, .xls, .xlsx')

INSERT INTO a_UPLOAD(upload_id , upload_name ,allowed_file_extensions) VALUES (62,'Resumes of Key Staff','.doc, .pdf, .rtf, .docx, .xls, .xlsx')

INSERT INTO a_UPLOAD(upload_id , upload_name ,allowed_file_extensions) VALUES (63,'Appendices and Supporting Documentation','.doc, .pdf, .rtf, .docx, .xls, .xlsx')

UPDATE s_id_gen set next_id = (select max(upload_id) + 1 from a_upload) where table_name='a_UPLOAD' 

GO

