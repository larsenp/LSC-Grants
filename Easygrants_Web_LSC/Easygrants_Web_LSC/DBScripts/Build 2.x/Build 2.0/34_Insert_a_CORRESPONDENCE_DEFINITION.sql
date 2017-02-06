insert a_correspondence_definition
	(correspondence_definition_id,
	title,
	correspondence_from,
	[subject],
	body,
	is_html,
	correspondence_description,
	is_log)
	values
		(115,
		'Application Review Submission Notification',
		'techsupport@lsc.gov',
		'Application Review Submission Notification',
		'Thank you for submitting your application review.',
		0,
		'Application Review Submission Notification',
		1)

insert a_correspondence_definition
	(correspondence_definition_id,
	title,
	correspondence_from,
	[subject],
	body,
	is_html,
	correspondence_description,
	is_log)
	values
		(116,
		'Renewal Review Submission Notification',
		'techsupport@lsc.gov',
		'Renewal Review Submission Notification',
		'Thank you for submitting your renewal review.',
		0,
		'Renewal Review Submission Notification',
		1)

update s_id_gen
	set next_id = 117
	where table_name = 'a_CORRESPONDENCE_DEFINITION'
