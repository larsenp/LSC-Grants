
CREATE VIEW [dbo].[vLSC_EXPENDITURE_BY_TYPE_SEC_B_PERCENT]

AS

SELECT lebt.lsc_expenditure_by_type_id,
	ISNULL(lebt.amount, 0) amount_by_type,
	ISNULL(lebtp.amount, 0) cases_total,
	CASE WHEN ISNULL(lebtp.amount, 0) = 0 THEN NULL
		ELSE 100*ISNULL(lebt.amount, 0)/lebtp.amount END AS percent_of_cases
	FROM LSC_EXPENDITURE_BY_TYPE lebt
		JOIN LSC_EXPENDITURE_BY_TYPE lebtp ON lebt.wf_task_assignment_id = lebtp.wf_task_assignment_id
			AND lebtp.lsc_expenditure_type_id = 1 --Cases
		JOIN LSC_a_EXPENDITURE_TYPE let on lebt.lsc_expenditure_type_id = let.lsc_expenditure_type_id
	WHERE let.lsc_expenditure_section_id = 2