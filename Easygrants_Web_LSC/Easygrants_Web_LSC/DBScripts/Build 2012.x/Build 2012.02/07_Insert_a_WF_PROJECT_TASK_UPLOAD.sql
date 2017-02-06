--Associate new file types and existing file types with all funding cycles active for 2013
--(2013 competition, 2012 and 2011 renewal - associations for existing file types have already been made for 2011 renewal.)

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
			and wfp.time_period_id = 18

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
			and wfp.time_period_id = 18

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
			join lsc_a_service_area sa on wfp.competition_id = sa.competition_id
		where wfpt.wf_task_id in (2,66)
			and wfp.time_period_id = 18
			and sa.service_area_type_id = 1

insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		6,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
			join lsc_a_service_area sa on wfp.competition_id = sa.competition_id
		where wfpt.wf_task_id in (4,67)
			and wfp.time_period_id = 17
			and sa.service_area_type_id = 1

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
			and wfp.time_period_id = 18

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
			and wfp.time_period_id = 18

--Grant renewal narrative - standard renewal 2012
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
			and wfp.time_period_id = 17

--Technology plan - comp 2013, renewal 2012
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
			and wfp.time_period_id = 18

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
			and wfp.time_period_id = 17

--Organizational Chart - all
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		22,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where (wfpt.wf_task_id in (2,66) and wfp.time_period_id = 18)
			or (wfpt.wf_task_id in (4,67) and wfp.time_period_id = 17)

--Resumes - standard and post-PQV comp
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		23,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66) and wfp.time_period_id = 18

--IRS Form 990 - all (including 2011 renewals)
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		28,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where (wfpt.wf_task_id in (2,66) and wfp.time_period_id = 18)
			or (wfpt.wf_task_id in (4,67) and wfp.time_period_id in (16,17))

--Accounting Manual - all (including 2011 renewals)
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		29,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where (wfpt.wf_task_id in (2,66) and wfp.time_period_id = 18)
			or (wfpt.wf_task_id in (4,67) and wfp.time_period_id in (16,17))

--LRI - standard and post-PQV comp
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		26,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66) and wfp.time_period_id = 18

--Governing/Policy Body Plan - post-PQV comp
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		25,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 66 and wfp.time_period_id = 18


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
