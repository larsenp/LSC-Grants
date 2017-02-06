CREATE VIEW vLSC_EXPENDITURE_BY_TYPE_SEC_B_TOTAL

AS

SELECT lebt.wf_task_assignment_id,
	SUM(lebtspb.amount_by_type) amount_by_type,
	AVG(lebtspb.cases_total) cases_total,
	CASE WHEN AVG(lebtspb.cases_total) = 0 THEN NULL
		ELSE 100*SUM(lebtspb.amount_by_type)/AVG(lebtspb.cases_total) END AS percent_of_cases
	FROM vLSC_EXPENDITURE_BY_TYPE_SEC_B_PERCENT lebtspb
		JOIN LSC_EXPENDITURE_BY_TYPE lebt ON lebtspb.lsc_expenditure_by_type_id = lebt.lsc_expenditure_by_type_id
	GROUP BY lebt.wf_task_assignment_id