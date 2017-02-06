CREATE VIEW vLSC_TIG_BUDGET_NARRATIVE_PDF

AS

SELECT tbi.lsc_tig_budget_item_id,
	tb.wf_task_assignment_id,
	tbl.abbr + '.' + tbft.abbr + ' ' + tbl.description + ' - ' + tbft.description budget_line_description,
	tbi.amount,
	tbi.comment
	FROM LSC_TIG_BUDGET_ITEM tbi
		JOIN LSC_TIG_BUDGET tb ON tbi.lsc_tig_budget_id = tb.lsc_tig_budget_id
		JOIN LSC_a_TIG_BUDGET_FUNDING_TYPE tbft ON tbi.lsc_tig_budget_funding_type_id = tbft.id
		JOIN LSC_a_TIG_BUDGET_LINE tbl ON tbi.lsc_tig_budget_line_id = tbl.id
	WHERE tb.wf_task_assignment_id IS NOT NULL
