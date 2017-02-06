USE [Easygrants]
GO
/****** Object:  View [dbo].[vLSC_WFTA_BUDGET_PERIOD]    Script Date: 02/22/2008 15:08:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
View created 2/22/2008 to provide a link from task assignment to budget and budget 
period for all task assignments with corresponding budgets. Will need to be updated in
future to account for report budgets.
- Peter Larsen
*/

CREATE VIEW [dbo].[vLSC_WFTA_BUDGET_PERIOD]

AS

select wfta.wf_task_assignment_id,
	b.budget_id,
	bp.budget_period_id
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN BUDGET b on wfta.grantee_project_id = b.grantee_project_id
		LEFT JOIN BUDGET_PERIOD bp ON b.budget_id = bp.budget_id
	WHERE wfta.wf_task_id = 2
		AND b.budget_type_id = 1

UNION ALL

SELECT wfta.wf_task_assignment_id,
	b.budget_id,
	bp.budget_period_id
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN BUDGET b on wfta.grantee_project_id = b.grantee_project_id
		LEFT JOIN BUDGET_PERIOD bp ON b.budget_id = bp.budget_id
			AND wfta.award_term_id = bp.budget_period_description_id
	WHERE wfta.wf_task_id = 4
		AND b.budget_type_id = 2
