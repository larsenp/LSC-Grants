ALTER VIEW [dbo].[vLSC_PRO_BONO_PRIMARY_SCORE_BY_REVIEW_ASSIGNMENT]

AS

SELECT wf_task_assignment_id
	,SUM(raw_score) raw_score
	,SUM(weighted_score) weighted_score
	,SUM(max_score) max_score
	FROM vLSC_PRO_BONO_PRIMARY_SCORE_BY_CATEGORY
	GROUP BY wf_task_assignment_id