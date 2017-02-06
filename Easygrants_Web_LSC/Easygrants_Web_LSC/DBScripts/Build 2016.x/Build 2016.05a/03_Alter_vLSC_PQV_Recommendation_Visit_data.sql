ALTER VIEW [dbo].[vLSC_PQV_Recommendation_Visit_data]

AS
SELECT  
opp_program_visit_id,
lsc_pqv_report_id,
state,
organization_id,
organization,
recipient_id,
purpose,
visit_date
FROM [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.OPP_PROGRAM_VISIT pv
          JOIN lsc_PQV_report r ON r.opp_site_visit_id = pv.opp_program_visit_id
          JOIN Organization o ON o.legacy_organization_id = pv.recipient_id
