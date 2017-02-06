CREATE VIEW vLSC_MOST_RECENT_OPP_VISIT_BY_TYPE

AS

SELECT o.organization_id,
	o.organization_name,
	o.legacy_organization_id recipient_id,
	opv.purpose,
	max(opv.visit_date) visit_date
	FROM [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.OPP_PROGRAM_VISIT opv
		JOIN ORGANIZATION o ON opv.recipient_id = o.legacy_organization_id
	GROUP BY o.organization_id,
		o.organization_name,
		o.legacy_organization_id,
		opv.purpose

