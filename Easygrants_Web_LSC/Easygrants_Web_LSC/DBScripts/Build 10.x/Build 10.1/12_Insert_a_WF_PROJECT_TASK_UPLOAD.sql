--Associate new file types and existing file types with all funding cycles active for 2011
--(2012 competition, 2011 and 2010 renewal - associations for existing file types have already been made for 2010 renewal.)

--Create temp table for data to be inserted
create table #wfptu
	(ident int identity(0,1),
	wf_project_task_upload_id int,
	wf_project_task_id int,
	upload_id int,
	is_required bit,
	general_upload bit)

--Proposal Narrative - traditional comp only
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	is_required,
	general_upload)
	select wfpt.id,
		2,
		1,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 17

--Program Evaluation and Monitoring Report (PEM) - traditional and post-PQV comp
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		5,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66)
			and wfp.time_period_id = 17

--Applicant PAI Plan - traditional and post-PQV comp 2012, traditional and post-PQV renewal 2011, and post-PQV renewal 2010
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		6,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66)
			and wfp.time_period_id = 17

insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		6,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (4,67)
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
			and wfp.time_period_id = 7

--Subgrant certification - traditional and post-PQV comp
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		7,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66)
			and wfp.time_period_id = 17

--Financial audits - traditional comp only (new applicants only - thus excluded from post-PQV comp)
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		8,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 17

--Grant renewal narrative - traditional renewal 2011
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		11,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 4
			and wfp.time_period_id = 16

--Technology plan - comp 2012, renewal 2011, and post-PQV renewal 2010
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		13,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66)
			and wfp.time_period_id = 17

insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		13,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (4,67)
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
			and wfp.time_period_id = 7
			
--Organizational Chart - post-PQV comp and renewal
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		22,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where (wfpt.wf_task_id = 66 and wfp.time_period_id = 17)
			or (wfpt.wf_task_id = 67 and wfp.time_period_id in (7,16))

--Resumes - post-PQV comp and renewal
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		23,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where (wfpt.wf_task_id = 66 and wfp.time_period_id = 17)
			or (wfpt.wf_task_id = 67 and wfp.time_period_id in (7,16))


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

drop table #wfptu

--delete Grant Assurances (Form C) from 2010 renewals. This is a download-only file associated with the Upload Certification task.
delete a_wf_project_task_upload
	from a_wf_project_task_upload wfptu
		join a_wf_project_task wfpt on wfptu.wf_project_task_id = wfpt.id
		join a_wf_project wfp on wfpt.wf_project_id = wfp.id
	where wfpt.wf_task_id = 4
		and wfp.time_period_id = 7
		and wfptu.upload_id = 9
