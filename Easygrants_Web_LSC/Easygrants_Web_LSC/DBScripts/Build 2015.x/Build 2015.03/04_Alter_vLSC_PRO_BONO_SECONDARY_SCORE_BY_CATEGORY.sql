ALTER VIEW [dbo].[vLSC_PRO_BONO_SECONDARY_SCORE_BY_CATEGORY]

AS

SELECT pbrs.lsc_pro_bono_review_score_id
	,pbrs.wf_task_assignment_id
	,pbrs.lsc_pro_bono_category_id
	,pbrs.lsc_pro_bono_review_score_lkp_id
	,apbs.score_value raw_score
	,pbc.weighting
	,ISNULL(CAST(apbs.score_value AS DECIMAL)*pbc.weighting/pbc.max_score, 0) weighted_score
	,pbc.max_score
	,pbrs.comment
	FROM LSC_PRO_BONO_REVIEW_SCORE pbrs
		JOIN LSC_c_PRO_BONO_REVIEW_SCORE apbs ON pbrs.lsc_pro_bono_review_score_lkp_id = apbs.id
		JOIN LSC_a_PRO_BONO_CATEGORY pbc ON pbrs.lsc_pro_bono_category_id = pbc.id