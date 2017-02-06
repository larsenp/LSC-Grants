--Modify e-mail template for confirmation of submission of registration

update a_correspondence_definition
    set correspondence_key = 'RegSubmitStaff',
		correspondence_to = '[FirstName] [LastName]',
		body = 'Dear [FirstName] [LastName],' + char(10) + char(13) + 'Thank you for registering your organization, [PersonPrimaryAffiliation.Organization.OrganizationName], with LSC Grants. '
    where correspondence_definition_id = 20

