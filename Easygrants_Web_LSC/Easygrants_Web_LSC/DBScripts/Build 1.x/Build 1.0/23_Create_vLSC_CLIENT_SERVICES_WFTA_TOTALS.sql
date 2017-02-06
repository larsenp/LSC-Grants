CREATE VIEW vLSC_CLIENT_SERVICES_WFTA_TOTALS
AS
SELECT lcs.wf_task_assignment_id,
	SUM(lcs.cases_closed_limited_svc) AS cases_closed_limited_svc,
	SUM(lcs.cases_closed_extended_svc) AS cases_closed_extended_svc,
	SUM(lcst.cases_closed_total) AS cases_closed_total,
	SUM(lcs.cases_open) AS cases_open
	FROM LSC_CLIENT_SERVICES lcs
		JOIN vLSC_CLIENT_SERVICES_TOTALS lcst on lcs.lsc_client_services_id = lcst.lsc_client_services_id
	GROUP BY lcs.wf_task_assignment_id