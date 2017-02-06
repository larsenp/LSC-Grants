ALTER VIEW [dbo].[vLSC_COMP_RENEWAL_APP_FILE_VALID]

AS

SELECT wfta.wf_task_assignment_id,
	wfta.wf_task_id,
	ocg.is_current_grantee,
	sa.service_area_type_id,
	gpi.allocated_by_subgrants,
	sf.submitted_file_id,
	wfptu.upload_id,
	CASE WHEN wfptu.upload_id = 6 AND sa.service_area_type_id = 1 THEN 1
		WHEN wfptu.upload_id = 6 AND sa.service_area_type_id <> 1 THEN 0
		WHEN wfptu.upload_id = 7 AND gpi.allocated_by_subgrants = 1 THEN 1
		WHEN wfptu.upload_id = 7 AND gpi.allocated_by_subgrants = 0 THEN 0
		WHEN wfptu.upload_id = 8 AND ocg.is_current_grantee = 0 THEN 1
		WHEN wfptu.upload_id = 8 AND ocg.is_current_grantee = 1 THEN 0 
        WHEN wfptu.upload_id = 36 AND fiscal.bod_finance_charter = 1 THEN 1
        WHEN wfptu.upload_id = 36 AND fiscal.bod_finance_charter = 0 THEN 0
        WHEN wfptu.upload_id = 37 AND fiscal.bod_audit_charter = 1 THEN 1
        WHEN wfptu.upload_id = 37 AND fiscal.bod_audit_charter = 0 THEN 0 
        WHEN wfptu.upload_id = 35 AND fiscal.unresolved_sgc = 1 THEN 1
        WHEN wfptu.upload_id = 35 AND fiscal.unresolved_sgc = 0 THEN 0 
		WHEN wfptu.upload_id = 38 AND wfta.wf_task_id in (2,66) AND (cras.has_current_lsc_subgrants = 1 OR cras.plans_upcoming_lsc_subgrants = 1 OR cras.has_current_non_lsc_pai_subgrants = 1 OR cras.plans_upcoming_non_lsc_pai_subgrants = 1) THEN 1
		WHEN wfptu.upload_id = 38 AND wfta.wf_task_id in (4,67) OR NOT(cras.has_current_lsc_subgrants = 1 OR cras.plans_upcoming_lsc_subgrants = 1 OR cras.has_current_non_lsc_pai_subgrants = 1 OR cras.plans_upcoming_non_lsc_pai_subgrants = 1) THEN 0
    END is_required,
	CASE WHEN wfptu.upload_id = 6 AND sa.service_area_type_id = 1 AND sf.submitted_file_id IS NULL THEN 0
		WHEN wfptu.upload_id = 6 AND sa.service_area_type_id = 1 AND sf.submitted_file_id IS NOT NULL THEN 1
		WHEN wfptu.upload_id = 6 AND sa.service_area_type_id <> 1 THEN 1
		WHEN wfptu.upload_id = 7 AND gpi.allocated_by_subgrants = 1 AND sf.submitted_file_id IS NULL THEN 0
		WHEN wfptu.upload_id = 7 AND gpi.allocated_by_subgrants = 1 AND sf.submitted_file_id IS NOT NULL THEN 1
		WHEN wfptu.upload_id = 7 AND gpi.allocated_by_subgrants = 0 THEN 1
		WHEN wfptu.upload_id = 8 AND ocg.is_current_grantee = 0 AND sf.submitted_file_id IS NULL THEN 0
		WHEN wfptu.upload_id = 8 AND ocg.is_current_grantee = 0 AND sf.submitted_file_id IS NOT NULL THEN 1
		WHEN wfptu.upload_id = 8 AND ocg.is_current_grantee = 1 THEN 1 
		WHEN wfptu.upload_id = 35 AND fiscal.unresolved_sgc = 0 AND sf.submitted_file_id IS NULL THEN 1
		WHEN wfptu.upload_id = 35 AND fiscal.unresolved_sgc = 1 AND sf.submitted_file_id IS NULL THEN 0
        WHEN wfptu.upload_id = 36 AND fiscal.bod_finance_charter = 0 AND sf.submitted_file_id IS NULL THEN 1
		WHEN wfptu.upload_id = 36 AND fiscal.bod_finance_charter = 1 AND sf.submitted_file_id IS NULL THEN 0
        WHEN wfptu.upload_id = 37 AND fiscal.bod_audit_charter = 0 AND sf.submitted_file_id IS NULL THEN 1
		WHEN wfptu.upload_id = 37 AND fiscal.bod_audit_charter = 1 AND sf.submitted_file_id IS NULL THEN 0
		WHEN wfptu.upload_id = 38 AND wfta.wf_task_id in (2,66) AND (cras.has_current_lsc_subgrants = 1 OR cras.plans_upcoming_lsc_subgrants = 1 OR cras.has_current_non_lsc_pai_subgrants = 1 OR cras.plans_upcoming_non_lsc_pai_subgrants = 1) AND sf.submitted_file_id IS NULL THEN 0
		WHEN wfptu.upload_id = 38 AND wfta.wf_task_id in (2,66) AND (cras.has_current_lsc_subgrants = 1 OR cras.plans_upcoming_lsc_subgrants = 1 OR cras.has_current_non_lsc_pai_subgrants = 1 OR cras.plans_upcoming_non_lsc_pai_subgrants = 1) AND sf.submitted_file_id IS NOT NULL THEN 1
    END is_valid,
	sf.conversion_status
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN vLSC_ORGANIZATION_CURRENT_GRANTEE ocg ON gp.primary_organization_id = ocg.organization_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN dbo.LSC_a_SERVICE_AREA sa ON c.id = sa.competition_id
		JOIN a_WF_PROJECT_TASK wfpt ON wfta.wf_task_id = wfpt.wf_task_id
			AND gp.wf_project_id = wfpt.wf_project_id
		JOIN a_WF_PROJECT_TASK_UPLOAD wfptu ON wfpt.id = wfptu.wf_project_task_id
			AND wfptu.upload_id in (6,7,8, 35, 36, 37, 38)
		LEFT JOIN SUBMITTED_FILE sf ON wfta.wf_task_assignment_id = sf.entity_id
			AND sf.entity_dataobject_key = 'WfTaskAssignment'
			AND wfptu.wf_project_task_upload_id = sf.upload_id
		JOIN LSC_GRANTEE_PROJECT_INFO gpi ON gp.grantee_project_id = gpi.grantee_project_id
        JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON wfta.wf_task_assignment_id = cwosy.wf_task_assignment_id
        LEFT JOIN LSC_COMP_APPL_FISCAL fiscal ON cwosy.organization_id = fiscal.organization_id 
                                                   and cwosy.time_period_id = fiscal.time_period_id
		LEFT JOIN LSC_COMP_RENEW_APPL_SUBGRANT cras ON cwosy.organization_id = cras.organization_id 
                                                   and cwosy.time_period_id = cras.time_period_id
	WHERE wfta.wf_task_id in (2,4,66,67)	

