DECLARE @id INT;

EXECUTE  getid_sel 'a_CORRESPONDENCE_DEFINITION' , @id OUTPUT,2

INSERT INTO [a_CORRESPONDENCE_DEFINITION]([correspondence_definition_id], [correspondence_key], [title], [correspondence_to], [correspondence_from], [correspondence_cc], [correspondence_bcc], [subject], [body], [is_html], [user_id], [id], [correspondence_description], [is_log], [definition_key_id], [correspondence_from_name]) 
	VALUES(@id , 'SharepointDown', 'SharePoint down error', '', 'altumadmin@altum.com', NULL, 'EGAutoEmails@arlgroup.com', 'SharePoint Server Down Error', 'The Sharepoint server is currently down.', 0, 1, NULL, 'SharePoint Down', 1, 2, NULL);

RETURN
GO
