ALTER VIEW [dbo].[vLSC_PPS_MILESTONES]

AS

SELECT 2*lsc_tig_proposed_payment_schedule_id as id,
	lsc_tig_proposed_payment_schedule_id,
	null as payment_id,
	dbo.fnPaymentScheduleMilestones(null, lsc_tig_proposed_payment_schedule_id, char(13) + char(10) + char(13) + char(10)) AS milestones_text,
	dbo.fnPaymentScheduleMilestones(null, lsc_tig_proposed_payment_schedule_id, '<br/><br/>') AS milestones_html
	FROM LSC_TIG_PROPOSED_PAYMENT_SCHEDULE


UNION ALL

SELECT 2*payment_id + 1 as id,
	null as lsc_tig_proposed_payment_schedule_id,
	payment_id,
	dbo.fnPaymentScheduleMilestones(payment_id, null, char(13) + char(10) + char(13) + char(10)) AS milestones_text,
	dbo.fnPaymentScheduleMilestones(payment_id, null, '<br/><br/>') AS milestones_html
	FROM payment
