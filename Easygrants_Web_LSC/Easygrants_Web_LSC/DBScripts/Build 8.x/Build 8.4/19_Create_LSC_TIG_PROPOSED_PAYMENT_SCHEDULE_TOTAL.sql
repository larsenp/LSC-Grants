CREATE VIEW vLSC_TIG_PROPOSED_PAYMENT_SCHEDULE_TOTAL

AS

SELECT wf_task_assignment_id,
	sum(payment_amount) payment_total
	FROM LSC_TIG_PROPOSED_PAYMENT_SCHEDULE
	GROUP BY wf_task_assignment_id