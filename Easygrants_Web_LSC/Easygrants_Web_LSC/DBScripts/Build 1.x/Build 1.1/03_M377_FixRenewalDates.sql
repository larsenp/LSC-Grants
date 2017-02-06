
update a_wf_project_task
	set start_date = '2008-04-09',
		open_date = '2008-04-09',
		due_date = '2008-06-02',
		close_date = '2008-06-02',
		end_date = '2008-07-15'
	from a_wf_project_task wfpt
		join a_wf_project wfp on wfpt.wf_project_id = wfp.id
	where wfpt.wf_task_id = 4
		and wfp.time_period_id in (2,3)