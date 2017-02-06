--Necessary update in order to allow validation to work for Form L for 2010 grants

update a_wf_project_task_upload 
	set general_upload = 0
	where general_upload is null
