--synch a_WF_TASK values with dev environment, where code has already been written based on specific IDs
update s_id_gen
	set next_id = 39
	where table_name = 'a_wf_task'

