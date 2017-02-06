
update wf_task_assignment
	set wf_task_outcome_id = 8
	where wf_task_id = 4
		and wf_task_outcome_id = 6

update grantee_project_outcomes
	set outcome_id = 8
	where wf_task_id = 4
		and outcome_id = 6