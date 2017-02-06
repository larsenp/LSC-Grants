CREATE VIEW vLSC_PPQV_REVIEW_SCORE_BY_CATEGORY

AS

SELECT lrac.wf_task_assignment_id,
	lrac.lsc_review_assignment_category_id,
	MAX(lris.value) score,
	SUM(ISNULL(c.weighting, 0)) weighting,
	MAX(lris.value)*SUM(ISNULL(c.weighting, 0))/5 weighted_score
	FROM LSC_REVIEW_ASSIGNMENT_CATEGORY lrac
		JOIN LSC_a_REVIEW_CRITERION c ON lrac.lsc_review_category_id = c.lsc_review_category_id
		JOIN LSC_c_REVIEW_INQUIRY_SCORE lris ON lrac.lsc_review_inquiry_score_id = lris.id
	GROUP BY lrac.wf_task_assignment_id,
		lrac.lsc_review_assignment_category_id
