--OPP staff reviews of 2014 competitive application 
exec [spLSC_INSERT_PROJECT_TASKS]
    @time_period_id = 19,
    @wf_task_id = 5,
    @start_date = '2013-6-10',
    @open_date = '2013-6-10',
    @due_date = '2013-8-22',
    @close_date = '2013-8-23',
    @end_date = '2013-12-31' 

--Set dates in pre-2014 OPP staff reviews of renewal aplications so that they don't appear in to-do lists.
update wf_task_assignment
	set start_date = wfpt.start_date
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project_task wfpt on wfta.wf_task_id = wfpt.wf_task_id
			and gp.wf_project_id = wfpt.wf_project_id
	where wfta.wf_task_id = 6
		and (wfta.create_date < '2013-06-01'
			or wfta.wf_task_status_id = 2)
		and wfta.start_date is null

update wf_task_assignment
	set open_date = wfpt.open_date
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project_task wfpt on wfta.wf_task_id = wfpt.wf_task_id
			and gp.wf_project_id = wfpt.wf_project_id
	where wfta.wf_task_id = 6
		and (wfta.create_date < '2013-06-01'
			or wfta.wf_task_status_id = 2)
		and wfta.open_date is null

update wf_task_assignment
	set due_date = wfpt.due_date
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project_task wfpt on wfta.wf_task_id = wfpt.wf_task_id
			and gp.wf_project_id = wfpt.wf_project_id
	where wfta.wf_task_id = 6
		and (wfta.create_date < '2013-06-01'
			or wfta.wf_task_status_id = 2)
		and wfta.due_date is null

update wf_task_assignment
	set close_date = wfpt.close_date
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project_task wfpt on wfta.wf_task_id = wfpt.wf_task_id
			and gp.wf_project_id = wfpt.wf_project_id
	where wfta.wf_task_id = 6
		and (wfta.create_date < '2012-06-01'
			or wfta.wf_task_status_id = 2)
		and wfta.close_date is null

update wf_task_assignment
	set end_date = wfpt.end_date
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project_task wfpt on wfta.wf_task_id = wfpt.wf_task_id
			and gp.wf_project_id = wfpt.wf_project_id
	where wfta.wf_task_id = 6
		and (wfta.create_date < '2013-06-01'
			or wfta.wf_task_status_id = 2)
		and wfta.end_date is null

--Set dates for OPP staff review of 2014 renewal applications for 2012 grants
update a_wf_project_task
	set start_date = '2013-6-10',
		open_date = '2013-6-10',
		due_date = '2013-8-22',
		close_date = '2013-8-23',
		end_date = '2013-12-31' 
	from a_wf_project_task wfpt
		join a_wf_project wfp on wfpt.wf_project_id = wfp.id
	where wfpt.wf_task_id = 6
		and wfp.time_period_id = 17

--OPP Staff review of 2014 renewal applications for 2013 grants
exec [spLSC_INSERT_PROJECT_TASKS]
    @time_period_id = 18,
    @wf_task_id = 6,
    @start_date = '2013-6-10',
    @open_date = '2013-6-10',
    @due_date = '2013-8-22',
    @close_date = '2013-8-23',
    @end_date = '2013-12-31' 