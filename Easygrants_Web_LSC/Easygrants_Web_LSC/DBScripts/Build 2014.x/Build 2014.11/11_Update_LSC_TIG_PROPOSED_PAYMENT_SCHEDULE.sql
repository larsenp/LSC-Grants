update lsc_tig_proposed_payment_schedule
	set payment_date = '2014-10-1'
	from grantee_project gp 
		join a_wf_project wfp on gp.wf_project_id = wfp.id
		join a_competition c on wfp.competition_id = c.id
		join wf_task_assignment wfta on gp.grantee_project_id = wfta.grantee_project_id
			and wfta.wf_task_id = 59
		join lsc_tig_proposed_payment_schedule pps on wfta.wf_task_assignment_id = pps.wf_task_assignment_id
			and pps.payment_number = 1
	where gp.grant_status_id = 6
		and wfp.time_period_id = 19
		and c.program_id = 2
