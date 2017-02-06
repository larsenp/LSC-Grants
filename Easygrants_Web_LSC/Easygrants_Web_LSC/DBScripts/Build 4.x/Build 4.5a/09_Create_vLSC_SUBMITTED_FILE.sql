CREATE VIEW vLSC_SUBMITTED_FILE

AS

SELECT submitted_file_id,
	dbo.fnFileExtension(source_filename) source_filename_ext
	FROM submitted_file

