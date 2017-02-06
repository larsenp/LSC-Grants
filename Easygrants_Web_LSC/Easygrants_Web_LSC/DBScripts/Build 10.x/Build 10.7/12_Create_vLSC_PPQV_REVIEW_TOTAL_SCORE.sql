CREATE VIEW vLSC_PPQV_REVIEW_TOTAL_SCORE

AS

SELECT wf_task_assignment_id,
	SUM(weighted_score) total_score
	FROM vLSC_PPQV_REVIEW_SCORE_BY_CATEGORY
	GROUP BY wf_task_assignment_id