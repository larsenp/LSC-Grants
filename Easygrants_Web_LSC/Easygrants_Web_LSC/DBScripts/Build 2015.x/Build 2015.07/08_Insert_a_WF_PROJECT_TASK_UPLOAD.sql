CREATE TABLE #wfptu
	(ident INT IDENTITY(0,1)
	,wf_project_task_upload_id INT
	,wf_project_task_id INT
	,upload_id INT
	,general_upload INT)

INSERT #wfptu
	(wf_project_task_id
	,upload_id
	,general_upload)
	SELECT wfpt.id
		,72
		,0
		from vlsc_comp_wfta_org_servarea_year cwosy
			join grantee_project gp on cwosy.grantee_project_id = gp.grantee_project_id
			join a_wf_project_task wfpt on gp.wf_project_id = wfpt.wf_project_id
				and cwosy.wf_task_id = wfpt.wf_task_id
                                                     join a_wf_project wfp on wfp.id = gp.wf_project_id
		where cwosy.wf_task_id in (4,67)
			and cwosy.wfta_year = 2016 and wfp.time_period_id = 19

DECLARE @rowcount INT, @first_new_id INT

SELECT @rowcount = COUNT(*) FROM #wfptu

EXEC @first_new_id = spGETID_RANGE_SEL
   @table = 'a_WF_PROJECT_TASK_UPLOAD'
  ,@count = @rowcount
  ,@mode = 2

UPDATE #wfptu
	SET wf_project_task_upload_id = ident + @first_new_id

INSERT a_WF_PROJECT_TASK_UPLOAD
	(wf_project_task_upload_id 
	,wf_project_task_id 
	,upload_id 
	,general_upload )
	SELECT wf_project_task_upload_id 
		,wf_project_task_id 
		,upload_id 
		,general_upload 
		FROM #wfptu

SELECT * FROM #wfptu

DROP TABLE #wfptu
