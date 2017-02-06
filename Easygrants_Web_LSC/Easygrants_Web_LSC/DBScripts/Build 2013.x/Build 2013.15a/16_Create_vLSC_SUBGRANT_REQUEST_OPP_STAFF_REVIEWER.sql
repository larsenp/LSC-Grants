/****** Object:  View [dbo].[vLSC_SUBGRANT_REQUEST_OPP_STAFF_REVIEWER]    Script Date: 12/09/2013 10:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_SUBGRANT_REQUEST_OPP_STAFF_REVIEWER]

AS

SELECT wfta.wf_task_assignment_id,
	CASE WHEN ws.lsc_subgrant_grant_type_id = 4 THEN lor.tig_primary_reviewer_person_id ELSE lsp.cr_reviewer_person_id END reviewer_person_id
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN LSC_WFTA_SUBGRANT ws ON wfta.wf_task_assignment_id = ws.wf_task_assignment_id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		JOIN ADDRESS a ON o.organization_id = a.entity_id
			AND a.entity_type_id = 2
			AND a.is_primary = 1
		JOIN LSC_c_STATE_PROV lsp on a.state_province_id = lsp.state_province_id
		JOIN LSC_c_OPP_REGION lor ON lsp.opp_region_id = lor.id
	WHERE wfta.wf_task_id = 53

