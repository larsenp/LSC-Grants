CREATE VIEW vLSC_CLIENT_SERVICES_TOTALS
	AS
	SELECT lsc_client_services_id,
		ISNULL(cases_closed_limited_svc,0) + ISNULL(cases_closed_extended_svc,0) AS cases_closed_total
	FROM LSC_CLIENT_SERVICES

