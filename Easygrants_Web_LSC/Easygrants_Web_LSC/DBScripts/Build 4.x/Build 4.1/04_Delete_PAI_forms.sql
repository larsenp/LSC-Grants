--Remove assignments of PAI-only forms from Migrant Worker and Native American service areas
UPDATE WF_TASK_ASSIGNMENT
	SET wf_task_status_id = 3
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN LSC_a_SERVICE_AREA sa ON wfp.competition_id = sa.competition_id
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		JOIN dbo.LSC_a_WF_TASK lwft ON wfta.wf_task_id = lwft.wf_task_id
	WHERE lwft.is_pai = 1
		AND sa.service_area_type_id IN (2,3) --2 = Migrant Worker; 3 = Native American
		AND wcy.report_cycle_year = 2008
