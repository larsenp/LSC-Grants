CREATE VIEW vLSC_ORG_RECENT_PQV

AS

SELECT organization_id,
	legacy_organization_id,
	organization_name,
	dbo.fnLSC_MOST_RECENT_PQV_DATE(organization_id) most_recent_pqv,
	CASE WHEN dbo.fnLSC_MOST_RECENT_PQV_DATE(organization_id) IS NULL THEN 0
		WHEN YEAR(GETDATE()) - YEAR(dbo.fnLSC_MOST_RECENT_PQV_DATE(organization_id)) > 2 THEN 0
		ELSE 1 END has_recent_pqv
	FROM ORGANIZATION
