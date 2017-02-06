--Remove assignments of Form G-3(d): Actual Case Services (PAI) from Migrant Worker and Native American service areas
DELETE WF_TASK_ASSIGNMENT
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN LSC_a_SERVICE_AREA sa ON wfp.competition_id = sa.competition_id
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
	WHERE wfta.wf_task_id = 11 --Form G-3(d)
		AND sa.service_area_type_id IN (2,3) --2 = Migrant Worker; 3 = Native American