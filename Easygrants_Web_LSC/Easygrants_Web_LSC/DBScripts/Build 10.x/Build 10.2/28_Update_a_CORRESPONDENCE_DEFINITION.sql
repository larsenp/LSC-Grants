--Copy e-mail templates from test environment in which they were approved

UPDATE [a_CORRESPONDENCE_DEFINITION]
   SET [correspondence_key] = source.correspondence_key
      ,[title] = source.title
      ,[correspondence_to] = source.correspondence_to
      ,[correspondence_from] = source.correspondence_from
      ,[correspondence_cc] = source.correspondence_cc
      ,[correspondence_bcc] = source.correspondence_bcc
      ,[subject] = source.subject
      ,[body] = source.body
      ,[is_html] = source.is_html
      ,[user_id] = source.user_id
      ,[id] = source.id
      ,[correspondence_description] = source.correspondence_description
      ,[is_log] = source.is_log
      ,[definition_key_id] = source.definition_key_id
      ,[correspondence_from_name] = source.correspondence_from_name
	FROM [LSC-EG5DEV].Easygrants.dbo.a_CORRESPONDENCE_DEFINITION source
		JOIN a_CORRESPONDENCE_DEFINITION target on source.correspondence_definition_id = target.correspondence_definition_id
	WHERE source.correspondence_definition_id in (7, 29, 109, 111, 114)

