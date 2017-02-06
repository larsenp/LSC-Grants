declare @wf_project_id int, @competition_id int

select @wf_project_id = id,
	@competition_id = competition_id
	from a_wf_project
	where description = 'mks 2012'

select @wf_project_id, @competition_id 

delete a_work_group_task_list
	where wf_project_id = @wf_project_id

delete a_WF_PROJECT_TASK_PDF 
	from a_WF_PROJECT_TASK_PDF wfptp
		join a_WF_PROJECT_TASK wfpt on wfptp.wf_project_task_id = wfpt.id
	where wfpt.wf_project_id = @wf_project_id

delete a_WF_PROJECT_TASK
	where wf_project_id = @wf_project_id

delete a_budget_category
	where project_id = @wf_project_id

delete a_WF_PROJECT
	where id = @wf_project_id

update lsc_a_service_area 
	set lsc_service_area_status_id = 2
	where competition_id = @competition_id 
