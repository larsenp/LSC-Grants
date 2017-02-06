CREATE VIEW vWFTA_COMPETITION_YEAR

AS

/*
This view correlates each application and renewal task assignment with its competition year.
Application task assignments are related to the same year as the grant. Renewal tasks are
related to the following years based on WF_TASK_ASSIGNMENT.award_term_id (award_term_id = 2
for the second year (grant year + 1), 3 for the third year (grant year + 2).
Peter Larsen 5/27/2008
*/

select wfta.wf_task_assignment_id, 
	case when wfta.wf_task_id = 2 then tp.sort_order
		when wfta.wf_task_id = 4 then tp.sort_order + wfta.award_term_id - 1 end as wfta_year
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project wfp on gp.wf_project_id = wfp.id
		join c_time_period tp on wfp.time_period_id = tp.id
	where wfta.wf_task_id in (2,4)
