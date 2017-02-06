insert event_correspondence
	(event_correspondence_id,
	event_id,
	template_id)
	values
		(6,
		6,
		115)

insert event_correspondence
	(event_correspondence_id,
	event_id,
	template_id)
	values
		(7,
		7,
		116)


update s_id_gen
	set next_id = 8
	where table_name = 'event_correspondence'
