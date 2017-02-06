--This script sets the role_id correctly in outcomes related to grantee reporting tasks.
--This is required for proper functionality of the baseline task editing pages.

update a_wf_task_outcome
	set role_id = 8 
	from a_wf_task_outcome wfto
		join a_wf_task wft on wfto.task_id = wft.id
	where wft.wf_task_type_id = 3
