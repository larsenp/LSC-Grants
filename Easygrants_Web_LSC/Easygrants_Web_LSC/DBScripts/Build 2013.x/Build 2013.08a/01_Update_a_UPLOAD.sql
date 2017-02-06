UPDATE a_UPLOAD
	SET allowed_file_extensions = '.pdf'
		,invalid_file_extension_error_message = 'Proposal must be uploaded in PDF format.'
	where upload_name LIKE '%disaster%'
