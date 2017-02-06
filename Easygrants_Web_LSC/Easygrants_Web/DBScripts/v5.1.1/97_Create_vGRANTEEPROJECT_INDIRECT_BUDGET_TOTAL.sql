CREATE VIEW vGRANTEEPROJECT_INDIRECT_BUDGET_TOTAL AS
SELECT  SUM(dbo.BUDGET_ITEM.amount) AS total, 
		dbo.GRANTEE_PROJECT.grantee_project_id,
		dbo.BUDGET.entity_type_id,
		CASE WHEN SUM(dbo.BUDGET.total)  < (total_budget_limit * indirect_cost_limit)/100 THEN 'LessThan' 
			WHEN SUM(dbo.BUDGET.total) <= (total_budget_limit * indirect_cost_limit)/100  THEN 'LessThanEqual' 
			WHEN SUM(dbo.BUDGET.total) > (total_budget_limit * indirect_cost_limit)/100  THEN 'GreaterThan' 
			WHEN SUM(dbo.BUDGET.total) >= (total_budget_limit * indirect_cost_limit)/100  THEN 'GreaterThanEqual' 
			WHEN SUM(dbo.BUDGET.total) = (total_budget_limit * indirect_cost_limit)/100  THEN 'Equal' 
			ELSE 'NotEqual' END AS operator
FROM         dbo.BUDGET_ITEM INNER JOIN
                      dbo.a_BUDGET_CATEGORY ON dbo.a_BUDGET_CATEGORY.budget_category_id = dbo.BUDGET_ITEM.budget_category_id INNER JOIN
                      dbo.BUDGET_PERIOD ON dbo.BUDGET_ITEM.budget_period_id = dbo.BUDGET_PERIOD.budget_period_id INNER JOIN
                      dbo.BUDGET ON dbo.BUDGET_PERIOD.budget_id = dbo.BUDGET.budget_id INNER JOIN
                      dbo.GRANTEE_PROJECT ON dbo.BUDGET.grantee_project_id = dbo.GRANTEE_PROJECT.grantee_project_id INNER JOIN
                      dbo.a_WF_PROJECT ON dbo.GRANTEE_PROJECT.wf_project_id = dbo.a_WF_PROJECT.id
WHERE   (dbo.a_BUDGET_CATEGORY.is_indirect_cost = 1) AND (dbo.a_BUDGET_CATEGORY.has_child = 1)
GROUP BY dbo.GRANTEE_PROJECT.grantee_project_id, dbo.a_WF_PROJECT.total_budget_limit,indirect_cost_limit,dbo.BUDGET.entity_type_id