
/*
Developer		: 	Vikram Kumar Alle
Date			:	06/26/2009
Modification	:	Included + sign in the invalid characters list as in sharepoint folder getting created with space in place of pus sign.
					0004933: SharePoint : If No of characters of URL which is passing to sharepoint folder is more than 253, document will fail to open in EG 
*/

GO

UPDATE [s_SHAREPOINT_INTEGRATION] SET [invalid_character_regex] = '[ +\^~\"#%&*:<>?\\//{|}.\s -]*' WHERE [id] = 1;

GO

