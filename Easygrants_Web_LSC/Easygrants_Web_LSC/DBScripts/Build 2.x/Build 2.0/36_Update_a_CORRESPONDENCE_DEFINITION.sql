/*
This script will transfer the exact contents of the mail templates for notification
of submission of application and renewal reviews from the development database to the 
target database (test or production)
*/

UPDATE target
	SET correspondence_key = source.correspondence_key,
		title = source.title,
		correspondence_to = source.correspondence_to,
		correspondence_from = source.correspondence_from,
		correspondence_cc = source.correspondence_cc,
		correspondence_bcc = source.correspondence_bcc,
		subject = source.subject,
		body = source.body,
		is_html = source.is_html,
		user_id = source.user_id,
		id = source.id,
		correspondence_description = source.correspondence_description,
		is_log = source.is_log,
		definition_key_id = source.definition_key_id,
		correspondence_from_name = source.correspondence_from_name
	FROM [LSC-EGDEV].Easygrants.dbo.a_CORRESPONDENCE_DEFINITION source
		JOIN a_CORRESPONDENCE_DEFINITION target on source.correspondence_definition_id = target.correspondence_definition_id
	WHERE target.correspondence_definition_id IN (115,116)
