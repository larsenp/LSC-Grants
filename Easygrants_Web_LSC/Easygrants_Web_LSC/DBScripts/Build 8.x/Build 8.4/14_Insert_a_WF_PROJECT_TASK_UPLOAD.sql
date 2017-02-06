create table #wfptu
	(ident int identity(0,1),
	wf_project_task_upload_id int,
	wf_project_task_id int,
	upload_id int,
	is_required bit,
	general_upload bit)

insert #wfptu
	(wf_project_task_id ,
	upload_id ,
	is_required,
	general_upload)
	select wfpt.id, 
		17,
		0,
		0
		from a_wf_project_task wfpt
			left join a_wf_project_task_upload wfptu on wfpt.id = wfptu.wf_project_task_id
				and wfptu.upload_id = 17
		where wfpt.wf_task_id = 41
			and wfptu.wf_project_task_upload_id is null

insert #wfptu
	(wf_project_task_id ,
	upload_id ,
	is_required,
	general_upload)
	select wfpt.id, 
		18,
		0,
		0
		from a_wf_project_task wfpt
			left join a_wf_project_task_upload wfptu on wfpt.id = wfptu.wf_project_task_id
				and wfptu.upload_id = 18
		where wfpt.wf_task_id = 41
			and wfptu.wf_project_task_upload_id is null

declare @first_id int,
	@row_count int

select @row_count  = count(*) from #wfptu

exec @first_id = [spGETID_RANGE_SEL]
	@table = 'a_WF_PROJECT_TASK_UPLOAD',
	@count = @row_count,
	@mode = 2

update #wfptu
	set wf_project_task_upload_id = ident + @first_id

insert a_wf_project_task_upload
	(wf_project_task_upload_id,
	wf_project_task_id,
	upload_id,
	is_required,
	general_upload)
	select wf_project_task_upload_id,
		wf_project_task_id,
		upload_id,
		is_required,
		general_upload
		from #wfptu

drop table #wfptu