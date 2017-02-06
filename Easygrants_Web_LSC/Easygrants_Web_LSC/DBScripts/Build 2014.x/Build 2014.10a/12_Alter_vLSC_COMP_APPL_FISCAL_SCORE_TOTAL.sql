ALTER VIEW vLSC_COMP_APPL_FISCAL_SCORE_TOTAL

AS

SELECT wf_task_assignment_id
	,organization_id
	,time_period_id
	,response_subtotal
	,reviewer_score
	,total_score
	FROM vLSC_COMP_APPL_FISCAL_SCORE_TOTAL_2014

UNION ALL

SELECT wf_task_assignment_id
	,organization_id
	,time_period_id
	,NULL AS response_subtotal
	,NULL AS reviewer_score
	,total_score
	FROM vLSC_COMP_APPL_FISCAL_SCORE_TOTAL_2015
