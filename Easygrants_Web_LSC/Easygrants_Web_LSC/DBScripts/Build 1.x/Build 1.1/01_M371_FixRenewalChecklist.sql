--Remove 
-- - Program Evaluation & Monitoring Report (PEM) (upload_id = 5)
-- - Subgrant Certification (RFP Attachment 2) (upload_id = 7)
delete wfptu
	from a_wf_project_task_upload wfptu
		join a_wf_project_task wfpt on wfptu.wf_project_task_id = wfpt.id
	where wfpt.wf_task_id = 4
		and wfptu.upload_id in (5,7)

--Add
-- - Grant Assurances (Form C) (upload_id = 9)
exec spUPDATE_IDGEN

create table #wfptu
	(ident int identity(1,1),
	wf_project_task_upload_id int,
	wf_project_task_id int,
	upload_id int)

insert #wfptu
	(wf_project_task_id,
	upload_id)
	select wfpt.id wf_project_task_id,
		9 upload_id
		from a_wf_project_task wfpt
		where wfpt.wf_task_id = 4
			and (wfpt.description like '%2007%' or wfpt.description like '%2008%')

DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #wfptu

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'a_WF_PROJECT_TASK_UPLOAD', 
	@count = @rowcount, 
	@mode = 2

UPDATE #wfptu
	SET wf_project_task_upload_id = ident + @first_new_id - 1

insert a_wf_project_task_upload
	(wf_project_task_upload_id,
	wf_project_task_id,
	upload_id)
	select wf_project_task_upload_id,
		wf_project_task_id,
		upload_id
		from #wfptu

select * from #wfptu

drop table #wfptu

