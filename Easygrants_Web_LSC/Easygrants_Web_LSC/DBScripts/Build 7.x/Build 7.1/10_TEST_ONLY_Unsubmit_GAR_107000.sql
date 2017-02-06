update wfta
	set wf_task_status_id = 1
	from vto_do_list_gar g
		join wf_task_assignment wfta on g.wf_task_assignment_id = wfta.wf_task_assignment_id
	where g.person_id = 336