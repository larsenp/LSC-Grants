--Set allowed file extension types for Project Narrative Appendices
UPDATE a_UPLOAD
	SET allowed_file_extensions = '.doc, .docx, .pdf, .rtf'
	WHERE upload_id = 17