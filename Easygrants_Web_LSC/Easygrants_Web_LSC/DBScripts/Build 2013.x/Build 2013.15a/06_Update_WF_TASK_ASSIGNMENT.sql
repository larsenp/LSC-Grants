update wf_task_assignment
	set start_date = wfpt.start_date
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project_task wfpt on wfta.wf_task_id = wfpt.wf_task_id
			and gp.wf_project_id = wfpt.wf_project_id
	where wfta.wf_task_id = 93
		and wfta.start_date is null

update wf_task_assignment
	set open_date = wfpt.open_date
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project_task wfpt on wfta.wf_task_id = wfpt.wf_task_id
			and gp.wf_project_id = wfpt.wf_project_id
	where wfta.wf_task_id = 93
		and wfta.open_date is null

update wf_task_assignment
	set due_date = wfpt.due_date
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project_task wfpt on wfta.wf_task_id = wfpt.wf_task_id
			and gp.wf_project_id = wfpt.wf_project_id
	where wfta.wf_task_id = 93
		and wfta.due_date is null

update wf_task_assignment
	set close_date = wfpt.close_date
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project_task wfpt on wfta.wf_task_id = wfpt.wf_task_id
			and gp.wf_project_id = wfpt.wf_project_id
	where wfta.wf_task_id = 93
		and wfta.close_date is null

update wf_task_assignment
	set end_date = wfpt.end_date
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project_task wfpt on wfta.wf_task_id = wfpt.wf_task_id
			and gp.wf_project_id = wfpt.wf_project_id
	where wfta.wf_task_id = 93
		and wfta.end_date is null
