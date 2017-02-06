ALTER VIEW [dbo].[vLSC_PRO_BONO_PRIMARY_SCORE_BY_SUBCATEGORY]

AS

SELECT pbrs.lsc_pro_bono_review_score_id
	,pbrs.wf_task_assignment_id
	,pbrs.lsc_pro_bono_subcategory_id
	,pbrs.lsc_pro_bono_review_score_lkp_id
	,apbs.score_value raw_score
	,pbs.weighting
	,ISNULL(apbs.score_value*pbs.weighting/CAST(pbs.max_score AS DECIMAL), 0) weighted_score
	,pbrs.comment
	FROM LSC_PRO_BONO_REVIEW_SCORE pbrs
		JOIN LSC_c_PRO_BONO_REVIEW_SCORE apbs ON pbrs.lsc_pro_bono_review_score_lkp_id = apbs.id
		JOIN LSC_a_PRO_BONO_SUBCATEGORY pbs ON pbrs.lsc_pro_bono_subcategory_id = pbs.id
