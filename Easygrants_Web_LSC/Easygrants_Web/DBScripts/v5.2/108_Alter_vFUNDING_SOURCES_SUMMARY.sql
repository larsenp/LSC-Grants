ALTER VIEW [dbo].[vFUNDING_SOURCES_SUMMARY]
AS
SELECT     CONVERT(VARCHAR(10), dbo.GRANTEE_PROJECT_FUNDING_SOURCES.grantee_project_id) + '_' + CONVERT(VARCHAR(10), c_FUND_SOURCE_TYPE.id)  AS funding_sources_key, 
                      dbo.GRANTEE_PROJECT_FUNDING_SOURCES.grantee_project_id, SUM(dbo.GRANTEE_PROJECT_FUNDING_SOURCES.amount_allocated) AS Amount, 
                      'Total ' + dbo.c_FUND_SOURCE_TYPE.description AS description
FROM         dbo.GRANTEE_PROJECT_FUNDING_SOURCES INNER JOIN
                      dbo.a_FUND ON dbo.GRANTEE_PROJECT_FUNDING_SOURCES.fund_id = dbo.a_FUND.fund_id INNER JOIN
                      dbo.c_FUND_SOURCE_TYPE ON dbo.a_FUND.fund_source_type_id = dbo.c_FUND_SOURCE_TYPE.id
GROUP BY dbo.GRANTEE_PROJECT_FUNDING_SOURCES.grantee_project_id, c_FUND_SOURCE_TYPE.id, dbo.c_FUND_SOURCE_TYPE.description