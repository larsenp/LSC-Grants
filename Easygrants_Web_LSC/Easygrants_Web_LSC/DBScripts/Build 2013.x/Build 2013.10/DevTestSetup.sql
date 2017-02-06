--Open competitive app review assignments
update a_wf_project_task 
	set start_date = '2013-5-31'
		,open_date = '2013-5-31'
	from a_wf_project_task wfpt
		join a_wf_project wfp on wfpt.wf_project_id = wfp.id
	where wfpt.wf_task_id in (5,83)
		and wfp.time_period_id = 19

--Open renewal review assignments
update wf_task_assignment
	set start_date = '2013-5-31'
		,open_date = '2013-5-31'
	from wf_task_assignment wfta
		join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
	where wfta.wf_task_id = 6
		and wcy.wfta_year = 2014

--Open GAR interim forms		
update wf_task_assignment
	set open_date = '2013-6-1'
		,start_date = '2013-6-1'
	from wf_task_assignment wfta
		join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
	where wcy.lsc_gar_cycle_id = 14
