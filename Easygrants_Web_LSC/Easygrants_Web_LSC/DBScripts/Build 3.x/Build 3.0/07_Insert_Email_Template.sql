insert event
	(event_id,
	event_description)
	values (8,
		'Upload Certification Submission Notification')

update s_id_gen
	set next_id = 9
	where table_name = 'event'

insert a_correspondence_definition
	select * from [LSC-EGDEV].Easygrants.dbo.a_correspondence_definition 
		where correspondence_definition_id = 117

update s_id_gen
	set next_id = 118
	where table_name = 'a_correspondence_definition'

insert event_correspondence
	(event_correspondence_id,
	event_id,
	template_id)
	values(8,
		8,
		117)

update s_id_gen
	set next_id = 9
	where table_name = 'event_correspondence'

