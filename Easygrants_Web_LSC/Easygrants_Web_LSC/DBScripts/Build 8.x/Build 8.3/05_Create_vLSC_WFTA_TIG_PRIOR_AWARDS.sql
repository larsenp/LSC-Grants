CREATE VIEW vLSC_WFTA_TIG_PRIOR_AWARDS

AS

SELECT CAST(wfta.wf_task_assignment_id AS VARCHAR(6))+ '_' + gp_prior.legacy_grant_id wfta_tig, --concatenate values to create unique key for view
	wfta.wf_task_assignment_id,
	gp_prior.legacy_grant_id tig,
	tpa.comment
	FROM wf_task_assignment wfta
		JOIN grantee_project gp_curr ON wfta.grantee_project_id = gp_curr.grantee_project_id
		JOIN grantee_project gp_prior ON gp_curr.primary_organization_id = gp_prior.primary_organization_id
			AND gp_prior.grant_status_id in (1,4)
		JOIN a_wf_project wfp ON gp_prior.wf_project_id = wfp.id
		JOIN a_competition c ON wfp.competition_id = c.id
		LEFT JOIN lsc_tig_prior_awards tpa ON wfta.wf_task_assignment_id = tpa.wf_task_assignment_id
			AND gp_prior.legacy_grant_id = tpa.tig
	WHERE c.program_id = 2
