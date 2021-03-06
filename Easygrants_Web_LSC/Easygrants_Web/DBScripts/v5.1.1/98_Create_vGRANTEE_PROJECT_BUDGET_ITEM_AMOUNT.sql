CREATE VIEW [dbo].[vGRANTEE_PROJECT_BUDGET_ITEM_AMOUNT]
AS
SELECT	dbo.BUDGET.grantee_project_id AS GranteeProjectID, 
		dbo.BUDGET.budget_type_id AS BudgetTypeID, 
		dbo.BUDGET_ITEM.amount As Amount, 
		dbo.BUDGET_ITEM.budget_item_id As BudgetItemID, 
		dbo.GRANTEE_PROJECT.wf_project_id As WfProjectID,
		dbo.a_BUDGET_CATEGORY.is_indirect_cost As IsIndirectCost
FROM  dbo.BUDGET INNER JOIN
               dbo.BUDGET_PERIOD ON dbo.BUDGET.budget_id = dbo.BUDGET_PERIOD.budget_id INNER JOIN
               dbo.BUDGET_ITEM ON dbo.BUDGET_PERIOD.budget_period_id = dbo.BUDGET_ITEM.budget_period_id INNER JOIN
               dbo.a_BUDGET_CATEGORY ON dbo.BUDGET_ITEM.budget_category_id = dbo.a_BUDGET_CATEGORY.budget_category_id INNER JOIN
               dbo.GRANTEE_PROJECT ON dbo.BUDGET.grantee_project_id = dbo.GRANTEE_PROJECT.grantee_project_id AND 
               dbo.BUDGET_ITEM.grantee_project_id = dbo.GRANTEE_PROJECT.grantee_project_id AND 
               dbo.a_BUDGET_CATEGORY.project_id = dbo.GRANTEE_PROJECT.wf_project_id
GO