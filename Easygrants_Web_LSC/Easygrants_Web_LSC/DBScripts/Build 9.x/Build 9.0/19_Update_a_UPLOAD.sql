--Set allowed file extension types for Subgrant file types
UPDATE a_UPLOAD
	SET allowed_file_extensions = '.pdf'
	WHERE upload_id in (19, 20, 21)