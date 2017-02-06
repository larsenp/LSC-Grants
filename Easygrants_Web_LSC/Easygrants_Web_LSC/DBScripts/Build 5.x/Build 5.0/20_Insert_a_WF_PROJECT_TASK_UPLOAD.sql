--Associate new file types and existing file types with all funding cycles active for 2010
--(2010 competition, 2008 and 2009 renewal)
--2008 renewal already has all but the new file types associated.

create table #wfptu
	(ident int identity(0,1),
	wf_project_task_upload_id int,
	wf_project_task_id int,
	upload_id int,
	is_required bit)

--Proposal Narrative - comp only
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	is_required)
	select wfpt.id,
		2,
		1
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 7

--Program Evaluation and Monitoring Report (PEM) - comp only
insert  #wfptu
	(wf_project_task_id,
	upload_id)
	select wfpt.id,
		5
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 7

--Applicant PAI Plan - comp 2010 and renewal 2009
insert  #wfptu
	(wf_project_task_id,
	upload_id)
	select wfpt.id,
		6
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 7

insert  #wfptu
	(wf_project_task_id,
	upload_id)
	select wfpt.id,
		6
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 4
			and wfp.time_period_id = 4

--Subgrant certification - comp only
insert  #wfptu
	(wf_project_task_id,
	upload_id)
	select wfpt.id,
		7
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 7

--Financial audits - comp only (new applicants only)
insert  #wfptu
	(wf_project_task_id,
	upload_id)
	select wfpt.id,
		8
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 7

--Grant assurances - comp 2010 and renewal 2009
insert  #wfptu
	(wf_project_task_id,
	upload_id)
	select wfpt.id,
		9
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 7

insert  #wfptu
	(wf_project_task_id,
	upload_id)
	select wfpt.id,
		9
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 4
			and wfp.time_period_id = 4

--Grant renewal narrative - renewal only
insert  #wfptu
	(wf_project_task_id,
	upload_id)
	select wfpt.id,
		11
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 4
			and wfp.time_period_id = 4

--Technology plan - comp 2010, renewal 2009, and renewal 2008
insert  #wfptu
	(wf_project_task_id,
	upload_id)
	select wfpt.id,
		13
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 7

insert  #wfptu
	(wf_project_task_id,
	upload_id)
	select wfpt.id,
		13
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 4
			and wfp.time_period_id = 4

insert  #wfptu
	(wf_project_task_id,
	upload_id)
	select wfpt.id,
		13
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 4
			and wfp.time_period_id = 3

--Technology budget - comp 2010, renewal 2009, and renewal 2008
insert  #wfptu
	(wf_project_task_id,
	upload_id)
	select wfpt.id,
		14
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 7

insert  #wfptu
	(wf_project_task_id,
	upload_id)
	select wfpt.id,
		14
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 4
			and wfp.time_period_id = 4

insert  #wfptu
	(wf_project_task_id,
	upload_id)
	select wfpt.id,
		14
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 4
			and wfp.time_period_id = 3

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
	is_required)
	select wf_project_task_upload_id,
		wf_project_task_id,
		upload_id,
		is_required
		from #wfptu

drop table #wfptu

