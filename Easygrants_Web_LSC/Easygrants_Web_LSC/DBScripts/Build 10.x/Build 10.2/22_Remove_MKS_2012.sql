delete a_work_group_task_list
	where wf_project_id = 2830

delete a_WF_PROJECT_TASK_PDF 
	from a_WF_PROJECT_TASK_PDF wfptp
		join a_WF_PROJECT_TASK wfpt on wfptp.wf_project_task_id = wfpt.id
	where wfpt.wf_project_id = 2830

delete a_WF_PROJECT_TASK
	where wf_project_id = 2830

delete a_budget_category
	where project_id = 2830

delete a_WF_PROJECT
	where id = 2830

update lsc_a_service_area 
	set lsc_service_area_status_id = 2
	where competition_id = 175
