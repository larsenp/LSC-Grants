--Restrict allowable file types for proposal narrative and grant renewal narrative

update a_upload
	set allowed_file_extensions = '.doc, .docx, .wpd'
	where upload_id in (2, 11)
