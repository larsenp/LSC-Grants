GO
CREATE VIEW [dbo].[vTOTAL_GRANT_AMENDMENT_AMOUNT]
AS
SELECT     SUM(amendment_amount) AS total_amendment_amount, grantee_project_id
FROM         dbo.GRANT_AWARD_AND_AMENDMENTS
GROUP BY grantee_project_id

GO