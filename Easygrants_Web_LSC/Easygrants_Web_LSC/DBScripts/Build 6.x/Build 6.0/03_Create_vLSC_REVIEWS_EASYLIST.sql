CREATE VIEW vLSC_REVIEWS_EASYLIST

AS

SELECT wfta.wf_task_assignment_id,
	pr.person_id reviewer_person_id,
	pr.name_last reviewer_last,
	pr.name_first reviewer_first,
	pnr.LastFirstMiddle reviewer_last_first,
	o.organization_id,
	o.legacy_organization_id recipient_id,
	o.organization_name,
	pa.person_id applicant_person_id,
	pa.name_last applicant_last,
	pa.name_first applicant_first,
	pna.LastFirstMiddle applicant_last_first,
	c.id competition_id,
	c.abbr serv_area,
	p.id program_id,
	wfta.wf_task_status_id,
	wfts.abbr wf_task_status,
	lrcs.time_period_id,
	tp.sort_order wfta_year,
	wft.id wf_task_id,
	wft.description wf_task
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
		JOIN PERSON pr ON wfta.person_id = pr.person_id
		JOIN vPERSON_NAMES pnr ON wfta.person_id = pnr.person_id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		JOIN PERSON pa ON gp.primary_person_id = pa.person_id
		JOIN vPERSON_NAMES pna ON pa.person_id = pna.person_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN a_PROGRAM p ON c.program_id = p.id
		JOIN a_WF_TASK_STATUS wfts on wfta.wf_task_status_id = wfts.id
		LEFT JOIN LSC_REVIEW_CYCLE_STAGE lrcs ON wfta.review_cycle_stage_id = lrcs.review_cycle_stage_id
		LEFT JOIN c_TIME_PERIOD tp ON lrcs.time_period_id = tp.id
	WHERE wft.wf_task_type_id = 4
