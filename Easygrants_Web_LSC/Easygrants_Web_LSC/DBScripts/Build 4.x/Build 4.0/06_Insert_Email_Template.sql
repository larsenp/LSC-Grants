INSERT EVENT
	(event_id,
	event_description)
	VALUES
		(9,
		'Grantee Report Submission Notification')

INSERT EVENT_CORRESPONDENCE
	(event_correspondence_id,
	event_id,
	template_id)
	VALUES (9, 9, 118)

UPDATE s_ID_GEN
	SET next_id = 10
	WHERE table_name IN ('EVENT', 'EVENT_CORRESPONDENCE')

INSERT [a_CORRESPONDENCE_DEFINITION]
           ([correspondence_definition_id]
           ,[title]
           ,[correspondence_to]
           ,[correspondence_from]
           ,[correspondence_bcc]
           ,[subject]
           ,[body]
           ,[is_html]
           ,[user_id]
           ,[correspondence_description]
           ,[is_log]
           ,[correspondence_from_name])
     VALUES
           (118
           ,'Grantee Report Submission Notification'
           ,'[Person.PersonPrimaryEMail.ContactValue1]'
           ,'TechSupport@lsc.gov'
           ,'techsupport@lsc.gov, competition@lsc.gov'
           ,'Report Submission'
           ,'Dear [Person.FirstName] [Person.LastName]:    Thank you for submitting [WfTask.WfTask] on behalf of [GranteeProject.PrimaryOrganization.OrganizationName] ([GranteeProject.PrimaryOrganization.LegacyOrganizationID]).'
           ,0
           ,4
           ,'Grantee Report Submission Notification'
           ,1
           ,'LSC Grants Technical Support')

UPDATE s_ID_GEN
	SET next_id = 119
	WHERE table_name = 'a_CORRESPONDENCE_DEFINITION'
