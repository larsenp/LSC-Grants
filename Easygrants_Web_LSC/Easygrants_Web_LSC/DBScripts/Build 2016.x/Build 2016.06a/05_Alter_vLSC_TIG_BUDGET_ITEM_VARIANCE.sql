ALTER VIEW [dbo].[vLSC_TIG_BUDGET_ITEM_VARIANCE]

AS

SELECT CAST(bi_p.lsc_tig_budget_item_id AS VARCHAR(7)) + '_' + CAST(bi_f.lsc_tig_budget_item_id AS VARCHAR(7)) lsc_tig_budget_item_variance_id,
	gp.grantee_project_id,
	bi_p.lsc_tig_budget_line_id,
	bi_p.lsc_tig_budget_funding_type_id,
	bi_p.lsc_tig_budget_item_id lsc_tig_budget_item_id_p,
	bi_f.lsc_tig_budget_item_id lsc_tig_budget_item_id_f,
	bi_p.lsc_tig_budget_id lsc_tig_budget_id_p,
	bi_f.lsc_tig_budget_id lsc_tig_budget_id_f,
	bi_p.amount amount_p,
	bi_f.amount amount_f,
	ISNULL(bi_f.amount, 0) - ISNULL(bi_p.amount, 0) variance,
	NULL budget_category_id,
	NULL sort_order
	FROM GRANTEE_PROJECT gp
		JOIN LSC_TIG_BUDGET b_p ON gp.grantee_project_id = b_p.grantee_project_id
			AND b_p.lsc_tig_budget_type_id = 1
		JOIN LSC_TIG_BUDGET_ITEM bi_p ON b_p.lsc_tig_budget_id = bi_p.lsc_tig_budget_id
		JOIN LSC_TIG_BUDGET b_f ON gp.grantee_project_id = b_f.grantee_project_id
			AND b_f.lsc_tig_budget_type_id = 2
		JOIN LSC_TIG_BUDGET_ITEM bi_f ON b_f.lsc_tig_budget_id = bi_f.lsc_tig_budget_id
			AND bi_p.lsc_tig_budget_line_id = bi_f.lsc_tig_budget_line_id
			AND bi_p.lsc_tig_budget_funding_type_id = bi_f.lsc_tig_budget_funding_type_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN c_TIME_PERIOD tp ON wfp.time_period_id = tp.id
	WHERE tp.sort_order <= 2013

UNION ALL

SELECT CAST(bi_p.lsc_tig_budget_item_id AS VARCHAR(7)) + '_' + CAST(bi_f.lsc_tig_budget_item_id AS VARCHAR(7)) lsc_tig_budget_item_variance_id,
	gp.grantee_project_id,
	NULL lsc_tig_budget_line_id,
	bi_p.lsc_tig_budget_funding_type_id,
	bi_p.lsc_tig_budget_item_id lsc_tig_budget_item_id_p,
	bi_f.lsc_tig_budget_item_id lsc_tig_budget_item_id_f,
	bi_p.lsc_tig_budget_id lsc_tig_budget_id_p,
	bi_f.lsc_tig_budget_id lsc_tig_budget_id_f,
	bi_p.amount amount_p,
	bi_f.amount amount_f,
	ISNULL(bi_f.amount, 0) - ISNULL(bi_p.amount, 0) variance,
	bc.budget_category_id,
	bc.sort_order
	FROM GRANTEE_PROJECT gp
		JOIN LSC_TIG_BUDGET b_p ON gp.grantee_project_id = b_p.grantee_project_id
			AND b_p.lsc_tig_budget_type_id = 1
		JOIN LSC_TIG_BUDGET_ITEM bi_p ON b_p.lsc_tig_budget_id = bi_p.lsc_tig_budget_id
		JOIN LSC_TIG_BUDGET b_f ON gp.grantee_project_id = b_f.grantee_project_id
			AND b_f.lsc_tig_budget_type_id = 2
		JOIN LSC_TIG_BUDGET_ITEM bi_f ON b_f.lsc_tig_budget_id = bi_f.lsc_tig_budget_id
			AND bi_p.budget_category_id = bi_f.budget_category_id
			AND bi_p.lsc_tig_budget_funding_type_id = bi_f.lsc_tig_budget_funding_type_id
		JOIN a_BUDGET_CATEGORY bc ON bi_f.budget_category_id = bc.budget_category_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN c_TIME_PERIOD tp ON wfp.time_period_id = tp.id
	WHERE tp.sort_order >= 2014
