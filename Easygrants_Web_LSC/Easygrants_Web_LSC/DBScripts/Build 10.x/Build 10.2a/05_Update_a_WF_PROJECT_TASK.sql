--Correct outcome_id associated with post-PQV competitive application (wf_task_id = 66)
--Reference Mantis 2137

update a_wf_project_task 
	set submitted_outcome_id = 136
	where wf_task_id = 66