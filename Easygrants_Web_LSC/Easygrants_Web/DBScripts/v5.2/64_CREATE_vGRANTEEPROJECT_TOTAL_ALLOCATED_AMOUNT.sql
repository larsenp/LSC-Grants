
CREATE VIEW [dbo].[vGRANTEEPROJECT_TOTAL_ALLOCATED_AMOUNT]
AS
SELECT grantee_project_id AS GranteeProjectID, SUM(amount_allocated) AS TotalAllocatedAmount
FROM  dbo.GRANTEE_PROJECT_FUNDING_SOURCES
GROUP BY grantee_project_id

