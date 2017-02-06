--Inserts uploads for newly created 2011 post-PQV renewal application project tasks 
--See script 07 (this folder) and Mantis 2885.

--Create temp table for data to be inserted
create table #wfptu
	(ident int identity(0,1),
	wf_project_task_upload_id int,
	wf_project_task_id int,
	upload_id int,
	is_required bit,
	general_upload bit)

insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		5,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 67
			and wfp.time_period_id = 16

insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		6,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 67
			and wfp.time_period_id = 16

insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		13,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 67
			and wfp.time_period_id = 16

insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		22,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 67
			and wfp.time_period_id = 16

insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		24,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 67
			and wfp.time_period_id = 16

--Assign IDs for insertion into database
declare @first_id int,
	@row_count int

select @row_count  = count(*) from #wfptu

exec @first_id = [spGETID_RANGE_SEL]
	@table = 'a_WF_PROJECT_TASK_UPLOAD',
	@count = @row_count,
	@mode = 2

update #wfptu
	set wf_project_task_upload_id = ident + @first_id

--insert into database
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
