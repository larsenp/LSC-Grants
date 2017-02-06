CREATE VIEW vLSC_VALIDATE_TIG_PROPOSED_PAYMENT_SCHEDULE

AS

WITH 
	first_p (wf_task_assignment_id, payment_amount) AS 
		(SELECT wf_task_assignment_id, payment_amount 
			FROM LSC_TIG_PROPOSED_PAYMENT_SCHEDULE pps
			WHERE pps.payment_number = 1),
	last_p (wf_task_assignment_id, payment_number) AS 
		(SELECT wf_task_assignment_id, MAX(payment_number)
			FROM LSC_TIG_PROPOSED_PAYMENT_SCHEDULE
			GROUP BY wf_task_assignment_id)
	SELECT f.wf_task_assignment_id, 
		ta.grant_request,
		f.payment_amount first_amount,
		CASE WHEN CAST(f.payment_amount AS DECIMAL)/ta.grant_request > .4 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END first_amount_valid,
		pps.payment_amount last_amount,
		CASE WHEN CAST(pps.payment_amount AS DECIMAL)/ta.grant_request < .2 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END last_amount_valid
		FROM first_p f 
			JOIN LSC_TIG_APP ta ON f.wf_task_assignment_id = ta.wf_task_assignment_id
			JOIN last_p l ON f.wf_task_assignment_id = l.wf_task_assignment_id
			JOIN LSC_TIG_PROPOSED_PAYMENT_SCHEDULE pps ON f.wf_task_assignment_id = pps.wf_task_assignment_id
				AND l.payment_number = pps.payment_number
	WHERE ta.grant_request IS NOT NULL AND ta.grant_request <> 0
