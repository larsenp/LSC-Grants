
GO
/****** Object:  View [dbo].[vOtherPersonnelFormattedPhone]    Script Date: 10/07/2008 09:52:08 ******/

CREATE VIEW [dbo].[vOtherPersonnelFormattedPhone]
AS
SELECT     grantee_project_primary_contact_id, dbo.fnFormatPhoneNumber(phone_number) AS phone_number
FROM         dbo.GRANTEE_PROJECT_PRIMARY_CONTACT

GO
