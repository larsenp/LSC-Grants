--Bring all updates from test system into live copy of template

UPDATE [a_CORRESPONDENCE_DEFINITION]
   SET [title] = t.title
      ,[correspondence_to] = t.correspondence_to
      ,[correspondence_from] = t.correspondence_from
      ,[correspondence_cc] = t.correspondence_cc
      ,[correspondence_bcc] = t.correspondence_bcc
      ,[subject] = t.subject
      ,[body] = t.body
      ,[is_html] = t.is_html
      ,[correspondence_description] = t.correspondence_description
      ,[is_log] = t.is_log
      ,[definition_key_id] = t.definition_key_id
      ,[correspondence_from_name] = t.correspondence_from_name
  FROM [a_CORRESPONDENCE_DEFINITION] cd
		JOIN [LSC-EGDEV].Easygrants.dbo.a_CORRESPONDENCE_DEFINITION t ON cd.correspondence_definition_id = t.[correspondence_definition_id]
 WHERE cd.[correspondence_definition_id] = 1007
