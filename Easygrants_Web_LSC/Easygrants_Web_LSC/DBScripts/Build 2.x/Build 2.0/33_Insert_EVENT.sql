insert event
	(event_id,
	event_description)
	values
		(6,
		'Application Review Submission Notification')

insert event
	(event_id,
	event_description)
	values
		(7,
		'Renewal Review Submission Notification')

update s_id_gen
	set next_id = 8
	where table_name = 'event'