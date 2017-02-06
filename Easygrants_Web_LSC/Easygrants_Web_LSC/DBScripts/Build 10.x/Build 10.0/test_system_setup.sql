--Do not run this script in production.

update wf_task_assignment
	set open_date = '2011-01-12'
	from wf_task_assignment wfta
		join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
	where wcy.report_cycle_year = 2010
