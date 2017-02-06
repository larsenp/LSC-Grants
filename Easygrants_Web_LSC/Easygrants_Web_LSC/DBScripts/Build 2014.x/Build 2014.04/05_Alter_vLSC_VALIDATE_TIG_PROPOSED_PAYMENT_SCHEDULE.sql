SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_VALIDATE_TIG_PROPOSED_PAYMENT_SCHEDULE]

AS

WITH 
	first_p (wf_task_assignment_id, payment_amount) AS 
		(SELECT wf_task_assignment_id, payment_amount 
			FROM LSC_TIG_PROPOSED_PAYMENT_SCHEDULE pps
			WHERE pps.payment_number = 1),
	last_p (wf_task_assignment_id, payment_amount) AS 
		(SELECT pps.wf_task_assignment_id, SUM(pps.payment_amount)
			FROM LSC_TIG_PROPOSED_PAYMENT_SCHEDULE pps
				JOIN vLSC_TIG_PROPOSED_PAYMENT_SCHEDULE_GROUPS ppsg ON pps.lsc_tig_proposed_payment_schedule_id = ppsg.lsc_tig_proposed_payment_schedule_id
					AND ppsg.payment_group = 3
			GROUP BY wf_task_assignment_id)
	SELECT f.wf_task_assignment_id, 
		ta.grant_request,
		f.payment_amount first_amount,
		CASE WHEN CAST(f.payment_amount AS DECIMAL)/ta.grant_request > .4 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END first_amount_valid,
		l.payment_amount last_amount,
		CASE WHEN CAST(l.payment_amount AS DECIMAL)/ta.grant_request < .2 AND l.payment_amount < 50000 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END last_amount_valid
		FROM first_p f 
			JOIN LSC_TIG_APP ta ON f.wf_task_assignment_id = ta.wf_task_assignment_id
			JOIN last_p l ON f.wf_task_assignment_id = l.wf_task_assignment_id
	WHERE ta.grant_request IS NOT NULL AND ta.grant_request <> 0
