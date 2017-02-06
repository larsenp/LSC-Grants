DECLARE @upload_id int

EXEC @upload_id = getid_sel
	@table = 'a_UPLOAD',
	@mode = 2

INSERT a_UPLOAD
	(upload_id,
	upload_name)
	VALUES(@upload_id,
	'Other Services Narrative (Form L)')

create table #wfptu
	(ident int identity(0,1),
	wf_project_task_upload_id int,
	wf_project_task_id int,
	upload_id int,
	is_required bit)

insert  #wfptu
	(wf_project_task_id,
	upload_id,
	is_required)
	select id,
		@upload_id,
		1
		from a_wf_project_task
		where wf_task_id = 18

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
	is_required)
	select wf_project_task_upload_id,
		wf_project_task_id,
		upload_id,
		is_required
		from #wfptu

drop table #wfptu

