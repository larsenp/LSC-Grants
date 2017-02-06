CREATE VIEW [dbo].[vGRANTEEPROJECT_BUDGET_TOTAL] as

SELECT	dbo.GRANTEE_PROJECT.grantee_project_id, 
		SUM(dbo.BUDGET.total) AS total, 
		dbo.BUDGET.entity_type_id, 
		dbo.a_WF_PROJECT.total_budget_limit, 
		CASE WHEN SUM(dbo.BUDGET.total) < total_budget_limit THEN 'LessThan' 
			WHEN SUM(dbo.BUDGET.total) <= total_budget_limit THEN 'LessThanEqual' 
			WHEN SUM(dbo.BUDGET.total) > total_budget_limit THEN 'GreaterThan' 
			WHEN SUM(dbo.BUDGET.total) >= total_budget_limit THEN 'GreaterThanEqual' 
			WHEN SUM(dbo.BUDGET.total) = total_budget_limit THEN 'Equal' 
			ELSE 'NotEqual' END AS operator
FROM		dbo.GRANTEE_PROJECT INNER JOIN
			dbo.BUDGET ON dbo.GRANTEE_PROJECT.grantee_project_id = dbo.BUDGET.grantee_project_id INNER JOIN
			dbo.a_WF_PROJECT ON dbo.GRANTEE_PROJECT.wf_project_id = dbo.a_WF_PROJECT.id
GROUP BY dbo.GRANTEE_PROJECT.grantee_project_id, dbo.BUDGET.entity_type_id, dbo.a_WF_PROJECT.total_budget_limit