--Set end dates for GAR task assignments so that they can be removed from GAR To Do Lists

update wf_task_assignment
	set end_date = cast(cast(report_cycle_year + 1 as varchar(4))  + '-5-16' as datetime)
	from wf_task_assignment wfta
		join a_wf_task wft on wfta.wf_task_id = wft.id
		join vWFTA_COMPETITION_YEAR wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project wfp on gp.wf_project_id = wfp.id
		join a_competition c on wfp.competition_id = c.id
	where wft.wf_task_type_id = 3
		and c.program_id = 1
		and wfta.end_date is null
		and wcy.report_cycle_year > 2007
