ALTER VIEW [dbo].[vLSC_PRO_BONO_PRIMARY_SCORE_BY_CATEGORY]

AS

SELECT CAST(pbpsbs.wf_task_assignment_id AS VARCHAR(6)) + '_' + CAST(pbrs.lsc_pro_bono_category_id AS VARCHAR(4)) lsc_pro_bono_primary_score_by_category_id
	,pbpsbs.wf_task_assignment_id
	,pbrs.lsc_pro_bono_category_id
	,SUM(pbpsbs.raw_score) raw_score
	,SUM(pbpsbs.weighted_score) weighted_score
	,SUM(pbrs.max_score) max_score
	FROM vLSC_PRO_BONO_PRIMARY_SCORE_BY_SUBCATEGORY pbpsbs
		JOIN LSC_a_PRO_BONO_SUBCATEGORY pbrs ON pbpsbs.lsc_pro_bono_subcategory_id = pbrs.id
	GROUP BY pbpsbs.wf_task_assignment_id
		,pbrs.lsc_pro_bono_category_id
