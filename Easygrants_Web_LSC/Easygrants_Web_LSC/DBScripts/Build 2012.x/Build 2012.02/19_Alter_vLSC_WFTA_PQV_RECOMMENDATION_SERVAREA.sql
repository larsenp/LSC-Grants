ALTER VIEW [dbo].[vLSC_WFTA_PQV_RECOMMENDATION_SERVAREA]

AS

SELECT wfta.wf_task_assignment_id,
	cwosy.organization_id primary_organization_id,
	cwosy.competition_id,
	cwosy.time_period_id,
	dbo.fnLSC_MOST_RECENT_PQV_ID(cwosy.organization_id) opp_program_visit_id,
	prs.lsc_pqv_recommendation_servarea_id,
	prec.lsc_pqv_recommendation_id,
	pa.sort_order pa,
	c.abbr c,
	prec.finding_number,
	prec.recommendation_number,
	prs.applicant_comment,
	prs.reviewer_comment
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON wfta.wf_task_assignment_id = cwosy.wf_task_assignment_id
		JOIN LSC_PQV_REPORT pr ON dbo.fnLSC_MOST_RECENT_PQV_ID(cwosy.organization_id) = pr.opp_site_visit_id
		JOIN LSC_PQV_RECOMMENDATION prec ON pr.lsc_pqv_report_id = prec.lsc_pqv_report_id
		LEFT JOIN LSC_PQV_RECOMMENDATION_SERVAREA prs ON prec.lsc_pqv_recommendation_id = prs.lsc_pqv_recommendation_id
			AND cwosy.competition_id = prs.competition_id
			AND cwosy.time_period_id = prs.time_period_id
		JOIN LSC_a_REVIEW_CRITERION c ON prec.lsc_criterion_id = c.id
		JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa ON c.lsc_review_performance_area_id = pa.id
