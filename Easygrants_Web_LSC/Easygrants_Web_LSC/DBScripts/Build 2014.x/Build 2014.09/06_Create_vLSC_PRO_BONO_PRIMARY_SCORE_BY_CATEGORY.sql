CREATE VIEW vLSC_PRO_BONO_PRIMARY_SCORE_BY_CATEGORY

AS

SELECT pbpsbs.wf_task_assignment_id
	,pbrs.lsc_pro_bono_category_id
	,SUM(pbpsbs.raw_score) raw_score
	,SUM(pbpsbs.weighted_score) weighted_score
	FROM vLSC_PRO_BONO_PRIMARY_SCORE_BY_SUBCATEGORY pbpsbs
		JOIN LSC_a_PRO_BONO_SUBCATEGORY pbrs ON pbpsbs.lsc_pro_bono_subcategory_id = pbrs.id
	GROUP BY pbpsbs.wf_task_assignment_id
		,pbrs.lsc_pro_bono_category_id
