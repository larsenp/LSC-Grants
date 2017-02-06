--Change task type of Application Review from Application to External Review

update a_wf_task
	set wf_task_type_id = 4
	where id = 5