--Create temp table for insert to a_wf_project_task_upload
create table #wfptu
	(ident int identity(0,1),
	wf_project_task_upload_id int,
	wf_project_task_id int,
	upload_id int,
	is_required bit,
	general_upload bit)

--Add rows for Request Subgrant Approval, Subgrant Agreement
insert #wfptu
	(wf_project_task_id ,
	upload_id ,
	is_required,
	general_upload)
	select wfpt.id, 
		19,
		1,
		0
		from a_wf_project_task wfpt
			left join a_wf_project_task_upload wfptu on wfpt.id = wfptu.wf_project_task_id
				and wfptu.upload_id = 19
		where wfpt.wf_task_id = 53
			and wfptu.wf_project_task_upload_id is null

--Add rows for Request Subgrant Approval, Subgrant Budget Schedule
insert #wfptu
	(wf_project_task_id ,
	upload_id ,
	is_required,
	general_upload)
	select wfpt.id, 
		20,
		0,
		0
		from a_wf_project_task wfpt
			left join a_wf_project_task_upload wfptu on wfpt.id = wfptu.wf_project_task_id
				and wfptu.upload_id = 20
		where wfpt.wf_task_id = 53
			and wfptu.wf_project_task_upload_id is null

--Add rows for Request Subgrant Approval, Subgrant Supporting Document 
insert #wfptu
	(wf_project_task_id ,
	upload_id ,
	is_required,
	general_upload)
	select wfpt.id, 
		21,
		0,
		0
		from a_wf_project_task wfpt
			left join a_wf_project_task_upload wfptu on wfpt.id = wfptu.wf_project_task_id
				and wfptu.upload_id = 21
		where wfpt.wf_task_id = 53
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