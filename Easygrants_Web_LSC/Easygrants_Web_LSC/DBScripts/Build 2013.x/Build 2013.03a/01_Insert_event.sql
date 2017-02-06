INSERT EVENT
	(event_id
	,event_description)
	VALUES
		(48
		,'1607 Compliance Reporting Submission Notification')

INSERT EVENT_CORRESPONDENCE
	(event_correspondence_id
	,event_id
	,template_id)
	VALUES
		(46
		,48
		,1014)

EXEC spUPDATE_IDGEN
	@select = 0
