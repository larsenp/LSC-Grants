CREATE VIEW vLSC_PPS_MILESTONES

AS

SELECT lsc_tig_proposed_payment_schedule_id,
	dbo.fnPaymentScheduleMilestones(lsc_tig_proposed_payment_schedule_id, char(13) + char(10) + char(13) + char(10)) AS milestones_text,
	dbo.fnPaymentScheduleMilestones(lsc_tig_proposed_payment_schedule_id, '<br/><br/>') AS milestones_html
	FROM LSC_TIG_PROPOSED_PAYMENT_SCHEDULE
