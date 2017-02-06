--Uploads association with Application for KS-1 2012

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
		where wfpt.wf_task_id = 2          -- 'Submit Application'
			and wfp.time_period_id = 17    -- '2012'
            and wfp.competition_id = 122   -- 'KS-1'

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
		where wfpt.wf_task_id = 2 
			and wfp.time_period_id = 17
            and wfp.competition_id = 122


---Applicant PAI Plan 
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
			and wfp.time_period_id = 17
            and wfp.competition_id = 122

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
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 17
            and wfp.competition_id = 122

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
            and wfp.competition_id = 122

--Technology plan
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
			and wfp.time_period_id = 17
            and wfp.competition_id = 122

--Applicant Staff Contact Information:
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	is_required,
	general_upload)
	select wfpt.id,
		24,
		1,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 17
            and wfp.competition_id = 122

--Organizational Chart: competitive 2012, renewal 2010 & 2011
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	is_required,
	general_upload)
	select wfpt.id,
		22,
		1,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 17
            and wfp.competition_id = 122

--Resumes competitive 2012
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	is_required,
	general_upload)
	select wfpt.id,
		23,
		1,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 17
            and wfp.competition_id = 122

--Governing/Policy Body Plan competitive 2012
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	is_required,
	general_upload)
	select wfpt.id,
		25,
		0,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 17
            and wfp.competition_id = 122


--LRI Submission competitive 2012
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	is_required,
	general_upload)
	select wfpt.id,
		26,
		0,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 17
            and wfp.competition_id = 122




-- select * from #wfptu



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