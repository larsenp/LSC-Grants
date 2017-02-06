ALTER VIEW [dbo].[vLSC_ORG_RECENT_PQV]

AS

SELECT organization_id,
	legacy_organization_id,
	organization_name,
	dbo.fnLSC_HAS_RECENT_PQV(organization_id) has_recent_pqv
	FROM ORGANIZATION
