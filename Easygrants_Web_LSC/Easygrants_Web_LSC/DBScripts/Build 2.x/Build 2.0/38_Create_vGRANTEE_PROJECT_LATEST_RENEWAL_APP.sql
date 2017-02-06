CREATE VIEW vGRANTEE_PROJECT_LATEST_RENEWAL_APP
AS

SELECT grantee_project_id,
	[dbo].[fnGranteeProjectLatestRenewalApp](grantee_project_id) latest_renewal_wfta_id
	FROM GRANTEE_PROJECT
