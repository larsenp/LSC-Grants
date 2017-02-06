--Add uploads separated out from the Proposal Narrative and/or Renewal Narrative

--Two file types did not previously exist in a_UPLOAD:
INSERT INTO [a_UPLOAD]
           ([upload_id]
           ,[upload_name]
           ,[allowed_file_extensions]
           ,[is_required]
           ,[create_date])
     VALUES
           (25
           ,'Governing/Policy Body Plan'
           ,'.pdf'
           ,1
           ,getdate())

INSERT INTO [a_UPLOAD]
           ([upload_id]
           ,[upload_name]
           ,[allowed_file_extensions]
           ,[is_required]
           ,[create_date])
     VALUES
           (26
           ,'LRI Submission'
           ,'.doc, .docx, .wpd'
           ,1
           ,getdate())

UPDATE s_ID_GEN
	SET next_id = 27
	WHERE table_name = 'a_UPLOAD'

--Create temp table for data to be inserted
create table #wfptu
	(ident int identity(0,1),
	wf_project_task_upload_id int,
	wf_project_task_id int,
	upload_id int,
	is_required bit,
	general_upload bit)

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
		where wfpt.wf_task_id in (2,66)
			and wfp.time_period_id = 17

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
		where wfpt.wf_task_id in (4,67)
			and wfp.time_period_id in (7,16)

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
		where wfpt.wf_task_id in (2,66)
			and wfp.time_period_id = 17

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
		where wfpt.wf_task_id in (2,66)
			and wfp.time_period_id = 17

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
		where wfpt.wf_task_id in (2,66)
			and wfp.time_period_id = 17

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


select wfpt.description,
	#wfptu.* 
	from #wfptu
		join a_wf_project_task wfpt on #wfptu.wf_project_task_id = wfpt.id

drop table #wfptu