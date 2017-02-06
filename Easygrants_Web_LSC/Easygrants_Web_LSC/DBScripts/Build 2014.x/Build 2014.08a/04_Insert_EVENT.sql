INSERT EVENT
	(event_id
	,event_description)
	VALUES
		(63
		,'Funding Application - Fiscal Component Submission Notification')

UPDATE s_ID_GEN
	SET next_id = 64
	WHERE table_name = 'EVENT'

DECLARE @next_id INT
EXEC @next_id = getid_sel @table = 'EVENT'

INSERT EVENT_CORRESPONDENCE
	(event_correspondence_id
	,event_id
	,template_id)
	VALUES
		(@next_id
		,63
		,1020)

