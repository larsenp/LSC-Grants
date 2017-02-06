CREATE VIEW vLSC_TIG_PROPOSED_PAYMENT_SCHEDULE_GROUPS

AS

WITH lastpayment (wf_task_assignment_id, last_payment_number) AS
	(SELECT wf_task_assignment_id
		,MAX(payment_number) last_payment_number
		FROM LSC_TIG_PROPOSED_PAYMENT_SCHEDULE
		GROUP BY wf_task_assignment_id
	)
	SELECT pps.lsc_tig_proposed_payment_schedule_id
		,CASE WHEN pps.payment_number = 1 THEN 1
			WHEN pps.payment_number > lp.last_payment_number - 2 THEN 3
			ELSE 2 END payment_group
		FROM LSC_TIG_PROPOSED_PAYMENT_SCHEDULE pps
			JOIN lastpayment lp ON pps.wf_task_assignment_id = lp.wf_task_assignment_id
