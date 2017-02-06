UPDATE WF_TASK_ASSIGNMENT
	SET end_date = '2012-5-15'
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
	WHERE wcy.lsc_gar_cycle_id = 11