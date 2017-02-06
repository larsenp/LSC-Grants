--Remove PEM and Applicant Staff Contact List uploads from post-PQV renewal app (Mantis 3771)
delete a_wf_project_task_upload
	from vlsc_comp_wfta_org_servarea_year cwosy
		join wf_task_assignment wfta on cwosy.wf_task_assignment_id = wfta.wf_task_assignment_id
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project_task wfpt on gp.wf_project_id = wfpt.wf_project_id
			and wfta.wf_task_id = wfpt.wf_task_id
		join a_wf_project_task_upload wfptu on wfpt.id = wfptu.wf_project_task_id
	where cwosy.wf_task_id = 67
		and cwosy.wfta_year = 2013
		and wfptu.upload_id in (5,24)

--Remove Governing/Policy Body Plan upload from post-PQV competitive app (Mantis 3774)
delete a_wf_project_task_upload
	from a_wf_project_task_upload wfptu
		join a_wf_project_task wfpt on wfptu.wf_project_task_id = wfpt.id
		join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		join a_upload u on wfptu.upload_id = u.upload_id
	where wfp.time_period_id = 18
		and wfpt.wf_task_id = 66
		and u.upload_id = 25
