--Sets open, due, close, and end dates within task assignments themselves.
--This is necessary because multiples of the same GAR task can be assigned
--within a single grantee project. Thus, we can't rely on the dates in the project task.

UPDATE WF_TASK_ASSIGNMENT
	SET open_date = wfpt.open_date,
		due_date = wfpt.due_date,
		close_date = wfpt.close_date,
		end_date = wfpt.end_date
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
		JOIN LSC_a_WF_TASK lwft ON wfta.wf_task_id = lwft.wf_task_id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT_TASK wfpt ON wfta.wf_task_id  = wfpt.wf_task_id
			AND gp.wf_project_id = wfpt.wf_project_id
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		WHERE wft.wf_task_type_id = 3
			AND ((wcy.wfta_year = 2008 AND lwft.is_projected = 0)
				OR (wcy.wfta_year = 2009 AND lwft.is_projected = 1))
