UPDATE a_UPLOAD
	SET allowed_file_extensions = '.doc, .docx, .pdf, .wpd',
		invalid_file_extension_error_message = 'Invalid file type. Permitted extensions are .doc, .docx, .pdf, and .wpd'
	WHERE upload_id = 12