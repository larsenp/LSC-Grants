--Implement Schedule C
--Correct start/open date for Schedule B
--Mantis 2837

--Update project tasks for Schedule C grantees in competition
update a_wf_project_task 
	set start_date = '2011-07-02',
		open_date = '2011-07-02',
		due_date = '2011-08-15',
		close_date = '2011-08-31'
	from organization o
		join grantee_project gp on o.organization_id = gp.primary_organization_id
		join a_wf_project wfp_curr on gp.wf_project_id = wfp_curr.id
		join a_competition c on wfp_curr.competition_id = c.id
		join a_wf_project wfp_2012 on c.id = wfp_2012.competition_id
			and wfp_2012.time_period_id = 17
		join a_wf_project_task wfpt on wfp_2012.id = wfpt.wf_project_id
			and wfpt.wf_task_id = 66
	where o.legacy_organization_id in (805270, 107000, 610010, 331016, 805260, 619081, 526051)
		and gp.grant_status_id = 1
		and c.program_id = 1

--Update task assignments for Schedule C grantees in renewal
update wf_task_assignment
	set start_date = '2011-07-02',
		open_date = '2011-07-02',
		due_date = '2011-08-15',
		close_date = '2011-08-31'
	from organization o
		join grantee_project gp on o.organization_id = gp.primary_organization_id
		join wf_task_assignment wfta on gp.grantee_project_id = wfta.grantee_project_id
			and wfta.wf_task_id = 67
	where o.legacy_organization_id in (805270, 107000, 610010, 331016, 805260, 619081, 526051)

--Reset start and open dates for Schedule B renewals
update wf_task_assignment
	set start_date = '2011-05-21',
		open_date = '2011-05-21'
	where wf_task_id = 67
		and start_date = '2011-05-20'

--Reset start and open dates for Schedule B service areas in competition
update a_wf_project_task
	set open_date = '2011-05-21', 
		start_date = '2011-05-21'
	where wf_task_id = 66
		and start_date = '2011-05-20'
