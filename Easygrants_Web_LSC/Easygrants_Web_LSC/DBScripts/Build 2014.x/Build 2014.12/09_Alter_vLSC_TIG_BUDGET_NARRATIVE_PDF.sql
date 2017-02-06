/* Already ran in live system

ALTER VIEW [dbo].[vLSC_TIG_BUDGET_NARRATIVE_PDF]

AS



SELECT tbi.lsc_tig_budget_item_id,
	tb.wf_task_assignment_id,
    gp.grantee_project_id,
	CAST(bc.sort_order AS VARCHAR(2)) + '.' + tbft.abbr + ' ' + bc.description + ' - ' + tbft.description budget_line_description,
	tbi.amount,
	tbi.comment,
	bc.sort_order budget_line_sort,
	tbft.sort_order funding_type_sort
	FROM LSC_TIG_BUDGET_ITEM tbi
		JOIN LSC_TIG_BUDGET tb ON tbi.lsc_tig_budget_id = tb.lsc_tig_budget_id
		JOIN LSC_a_TIG_BUDGET_FUNDING_TYPE tbft ON tbi.lsc_tig_budget_funding_type_id = tbft.id
		JOIN a_BUDGET_CATEGORY bc ON tbi.budget_category_id = bc.budget_category_id
		JOIN WF_TASK_ASSIGNMENT wfta ON tb.wf_task_assignment_id = wfta.wf_task_assignment_id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
        JOIN a_COMPETITION c ON wfp.competition_id = c.id
        JOIN c_time_period tp ON wfp.time_period_id = tp.id
	WHERE tb.wf_task_assignment_id IS NOT NULL

UNION ALL


SELECT tbi.lsc_tig_budget_item_id,
	tb.wf_task_assignment_id,
    gp.grantee_project_id,
	tbl.abbr + '.' + tbft.abbr + ' ' + tbl.description + ' - ' + tbft.description + CASE WHEN tbni.instruction IS NULL THEN '' ELSE ' (' + tbni.instruction + ')' END budget_line_description,
	tbi.amount,
	tbi.comment,
	tbl.sort_order budget_line_sort,
	tbft.sort_order funding_type_sort
	FROM LSC_TIG_BUDGET_ITEM tbi
		JOIN LSC_TIG_BUDGET tb ON tbi.lsc_tig_budget_id = tb.lsc_tig_budget_id
		JOIN LSC_a_TIG_BUDGET_FUNDING_TYPE tbft ON tbi.lsc_tig_budget_funding_type_id = tbft.id
		JOIN LSC_a_TIG_BUDGET_LINE tbl ON tbi.lsc_tig_budget_line_id = tbl.id
		JOIN WF_TASK_ASSIGNMENT wfta ON tb.wf_task_assignment_id = wfta.wf_task_assignment_id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		LEFT JOIN LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION tbni ON tbft.id = tbni.lsc_tig_budget_funding_type_id
			AND tbl.id = tbni.lsc_tig_budget_line_id
			AND wfp.time_period_id = tbni.time_period_id
        JOIN a_COMPETITION c ON wfp.competition_id = c.id
        JOIN c_time_period tp ON wfp.time_period_id = tp.id
	WHERE tb.wf_task_assignment_id IS NOT NULL

*/