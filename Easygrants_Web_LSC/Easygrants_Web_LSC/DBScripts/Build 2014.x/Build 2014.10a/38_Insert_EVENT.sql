INSERT EVENT
	(event_id
	,event_description)
	VALUES
		(69
		,'Submission of OCE staff review of fiscal form')

UPDATE s_ID_GEN
	SET next_id = 70
	WHERE table_name = 'EVENT'

INSERT EVENT_CORRESPONDENCE
	(event_correspondence_id
	,event_id
	,template_id)
	VALUES
		(70
		,69
		,1022)

UPDATE s_ID_GEN
	SET next_id = 71
	WHERE table_name = 'EVENT_CORRESPONDENCE'
