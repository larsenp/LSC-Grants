update wf_task_assignment
	set open_date = '2013-4-30'
		,start_date = '2013-4-30'
	from vlsc_comp_wfta_org_servarea_year cwosy
		join wf_task_assignment wfta on cwosy.wf_task_assignment_id = wfta.wf_task_assignment_id
	where cwosy.wf_task_id = 67
		and cwosy.wfta_year = 2014

update a_wf_project_task
	set open_date = '2013-4-30'
		,start_date = '2013-4-30'
	from a_wf_project_task wfpt
		join a_wf_project wfp on wfpt.wf_project_id = wfp.id
	where wfp.time_period_id = 19
		and wfpt.wf_task_id = 66
		
update a_wf_project_task
	set due_date = '2013-5-1'
	where wf_task_id = 3
		and description like '%2014%'

update a_wf_project_task
	set start_date = '2013-5-1'
		,open_date = '2013-5-1'
	where wf_task_id = 66
		and description like '%2014%'
