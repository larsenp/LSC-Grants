--Associate new file types and existing file types with all funding cycles active for 2011
--(2011 competition, 2009 and 2010 renewal)
--2009 renewal already has all file types associated.
--Remove Technology Budget from 2009 renewal

create table #wfptu
	(ident int identity(0,1),
	wf_project_task_upload_id int,
	wf_project_task_id int,
	upload_id int,
	is_required bit,
	general_upload bit)

--Proposal Narrative - comp only
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
			and wfp.time_period_id = 16

--Program Evaluation and Monitoring Report (PEM) - comp only
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		5,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 16

--Applicant PAI Plan - comp 2011 and renewal 2010
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		6,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
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
		where wfpt.wf_task_id = 4
			and wfp.time_period_id = 7

--Subgrant certification - comp only
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		7,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 16

--Financial audits - comp only (new applicants only)
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
			and wfp.time_period_id = 16

--Grant assurances - comp 2011 and renewal 2010
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		9,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 16

insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		9,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 4
			and wfp.time_period_id = 7

--Grant renewal narrative - renewal only
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
			and wfp.time_period_id = 7

--Technology plan - comp 2011 and renewal 2010
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		13,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
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
		where wfpt.wf_task_id = 4
			and wfp.time_period_id = 7

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

--Remove technology budget from Renewal 2009
delete a_wf_project_task_upload
	from a_wf_project_task_upload wfptu
		join a_wf_project_task wfpt on wfptu.wf_project_task_id = wfpt.id
		join a_wf_project wfp on wfpt.wf_project_id = wfp.id
	where wfpt.wf_task_id = 4
		and wfp.time_period_id = 4
		and wfptu.upload_id = 14