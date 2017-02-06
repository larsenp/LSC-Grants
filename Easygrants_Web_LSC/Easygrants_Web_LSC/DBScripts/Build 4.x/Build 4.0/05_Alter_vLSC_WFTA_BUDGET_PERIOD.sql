USE [Easygrants_Migration]
GO
/****** Object:  View [dbo].[vLSC_WFTA_BUDGET_PERIOD]    Script Date: 11/13/2008 15:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
View created 2/22/2008 to provide a link from task assignment to budget and budget 
period for all task assignments with corresponding budgets. Updated 11/13/2008 to account
for grantee reporting budget data.

Note that, for grantee reporting tasks, it is not sufficient to filter on budget period
to find the correct wf_task_assignment_id because there are multiple task assignments
for the submission of budget data. One must also filter on wf_task_assignment.wf_task_id.
- Peter Larsen
*/

ALTER VIEW [dbo].[vLSC_WFTA_BUDGET_PERIOD]

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

UNION ALL

SELECT wfta.wf_task_assignment_id,
	b.budget_id,
	bp.budget_period_id
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
		JOIN BUDGET b on wfta.grantee_project_id = b.grantee_project_id
		LEFT JOIN BUDGET_PERIOD bp ON b.budget_id = bp.budget_id
			AND wfta.award_term_id = bp.budget_period_description_id
	WHERE wft.wf_task_type_id = 3
		AND b.budget_type_id = 3

