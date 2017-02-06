ALTER VIEW [dbo].[vWFTA_COMPETITION_YEAR]

AS

select wfta.wf_task_assignment_id, 
	tp.id time_period_id,
	tp.sort_order wfta_year
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project wfp on gp.wf_project_id = wfp.id
		join c_time_period tp on wfp.time_period_id = tp.id
	where wfta.wf_task_id = 2

union all

select wfta.wf_task_assignment_id, 
	tp_wfta.id time_period_id,
	tp_wfta.sort_order wfta_year
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project wfp on gp.wf_project_id = wfp.id
		join c_time_period tp_gp on wfp.time_period_id = tp_gp.id
		join a_wf_task wft on wfta.wf_task_id = wft.id
		join c_time_period tp_wfta on tp_gp.sort_order + wfta.award_term_id - 1 = tp_wfta.sort_order
	where wfta.wf_task_id in (2,4,7)
		or wft.wf_task_type_id = 3

