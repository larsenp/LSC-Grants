DECLARE @template_id INT
	,@new_event_id INT
	,@new_ec_id INT
	

SET @template_id = 1015

EXEC @new_event_id = getid_sel @table = 'EVENT'

INSERT EVENT
	(event_id
	,event_description)
	VALUES(@new_event_id
		,'1607 Reporting - OPP staff reviewer notification')

EXEC @new_ec_id = getid_sel @table = 'EVENT_CORRESPONDENCE'

INSERT EVENT_CORRESPONDENCE
	(event_correspondence_id
	,event_id
	,template_id)
	VALUES(@new_ec_id
		,@new_event_id
		,@template_id)