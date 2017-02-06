--To associate task assignments with PQV recommendations and service areas for purposes of submission-level validation

CREATE VIEW vLSC_WFTA_PQV_RECOMMENDATION_SERVAREA

AS

SELECT wfta.wf_task_assignment_id,
	gp.primary_organization_id,
	wfp.competition_id,
	dbo.fnLSC_MOST_RECENT_PQV_ID(gp.primary_organization_id) opp_program_visit_id,
	prs.lsc_pqv_recommendation_servarea_id,
	prs.lsc_pqv_recommendation_id,
	prs.applicant_comment,
	prs.reviewer_comment
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN LSC_PQV_REPORT pr ON dbo.fnLSC_MOST_RECENT_PQV_ID(gp.primary_organization_id) = pr.opp_site_visit_id
		JOIN LSC_PQV_RECOMMENDATION prec ON pr.lsc_pqv_report_id = prec.lsc_pqv_report_id
		JOIN LSC_PQV_RECOMMENDATION_SERVAREA prs ON prec.lsc_pqv_recommendation_id = prs.lsc_pqv_recommendation_id
			AND wfp.competition_id = prs.competition_id
