--Require Technology Plan upload for Competitive... 
UPDATE a_WF_PROJECT_TASK_UPLOAD 
	SET is_required = 1
	FROM a_WF_PROJECT_TASK_UPLOAD wfptu
		JOIN a_WF_PROJECT_TASK wfpt ON wfptu.wf_project_task_id = wfpt.id
		JOIN a_WF_PROJECT wfp ON wfpt.wf_project_id = wfp.id
		JOIN c_TIME_PERIOD tp ON wfp.time_period_id = tp.id
	WHERE wfptu.upload_id = 13
		AND wfpt.wf_task_id = 2 
		AND tp.sort_order = 2011

--...and Renewal Applications
UPDATE a_WF_PROJECT_TASK_UPLOAD 
	SET is_required = 1
	FROM a_WF_PROJECT_TASK_UPLOAD wfptu
		JOIN a_WF_PROJECT_TASK wfpt ON wfptu.wf_project_task_id = wfpt.id
		JOIN GRANTEE_PROJECT gp ON wfpt.wf_project_id = gp.wf_project_id 
		JOIN WF_TASK_ASSIGNMENT wfta ON wfpt.wf_task_id = wfta.wf_task_id
			AND gp.grantee_project_id = wfta.grantee_project_id
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
	WHERE wfptu.upload_id = 13
		AND wfpt.wf_task_id = 4
		AND wcy.wfta_year = 2011

--Require Renewal Narrative for Renewal Applications
UPDATE a_WF_PROJECT_TASK_UPLOAD 
	SET is_required = 1
	FROM a_WF_PROJECT_TASK_UPLOAD wfptu
		JOIN a_WF_PROJECT_TASK wfpt ON wfptu.wf_project_task_id = wfpt.id
		JOIN GRANTEE_PROJECT gp ON wfpt.wf_project_id = gp.wf_project_id 
		JOIN WF_TASK_ASSIGNMENT wfta ON wfpt.wf_task_id = wfta.wf_task_id
			AND gp.grantee_project_id = wfta.grantee_project_id
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
	WHERE wfptu.upload_id = 11
		AND wfpt.wf_task_id = 4
		AND wcy.wfta_year = 2011

--Remove Grant Assurances (Form C) from Competitive...
DELETE a_WF_PROJECT_TASK_UPLOAD 
	FROM a_WF_PROJECT_TASK_UPLOAD wfptu
		JOIN a_WF_PROJECT_TASK wfpt ON wfptu.wf_project_task_id = wfpt.id
		JOIN a_WF_PROJECT wfp ON wfpt.wf_project_id = wfp.id
		JOIN c_TIME_PERIOD tp ON wfp.time_period_id = tp.id
	WHERE wfptu.upload_id = 9
		AND wfpt.wf_task_id = 2 
		AND tp.sort_order = 2011

--... and Renewal Applications
DELETE a_WF_PROJECT_TASK_UPLOAD 
	FROM a_WF_PROJECT_TASK_UPLOAD wfptu
		JOIN a_WF_PROJECT_TASK wfpt ON wfptu.wf_project_task_id = wfpt.id
		JOIN GRANTEE_PROJECT gp ON wfpt.wf_project_id = gp.wf_project_id 
		JOIN WF_TASK_ASSIGNMENT wfta ON wfpt.wf_task_id = wfta.wf_task_id
			AND gp.grantee_project_id = wfta.grantee_project_id
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
	WHERE wfptu.upload_id = 9
		AND wfpt.wf_task_id = 4
		AND wcy.wfta_year = 2011
