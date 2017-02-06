UPDATE a_UPLOAD
	SET allowed_file_extensions = replace(allowed_file_extensions , '.doc', '.doc, .docx')
	
GO

UPDATE a_UPLOAD
	SET allowed_file_extensions = replace(allowed_file_extensions , '.xls', '.xls, .xlsx')