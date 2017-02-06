--This script sets the MIME type for all NRL files, which is required by Firefox.
UPDATE SUBMITTED_FILE 
	SET source_mime_type = 'application/octet-stream'
	WHERE source_filename LIKE '%.nrl'
