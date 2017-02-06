CREATE TABLE #ins
	(ident INT IDENTITY(0,1)
	,wf_project_task_upload_id INT
	,wf_project_task_id INT
	,upload_id INT
	,is_required INT
	,general_upload INT)

INSERT #ins
	(wf_project_task_id
	,upload_id
	,is_required
	,general_upload)
	SELECT wfpt.id
		,wftu.upload_id
		,0
		,0
		FROM LSC_a_WF_TASK_UPLOAD wftu
			JOIN a_WF_PROJECT_TASK wfpt ON wftu.wf_task_id = wfpt.wf_task_id
			JOIN a_WF_PROJECT wfp ON wfpt.wf_project_id = wfp.id
			LEFT JOIN a_WF_PROJECT_TASK_UPLOAD wfptu ON wfpt.id = wfptu.wf_project_task_id
				AND wftu.upload_id = wfptu.upload_id
		WHERE wftu.wf_task_id = 2
			AND wfptu.wf_project_task_upload_id IS NULL
			AND wfp.time_period_id = 20

DECLARE @rowcount INT
	,@first_id INT

SELECT @rowcount = COUNT(*)
	FROM #ins

EXEC @first_id = spGETID_RANGE_SEL
	@mode = 2
	,@table = 'a_WF_PROJECT_TASK_UPLOAD'
	,@count = @rowcount

UPDATE #ins
	SET wf_project_task_upload_id = ident + @first_id

INSERT a_WF_PROJECT_TASK_UPLOAD
	(wf_project_task_upload_id 
	,wf_project_task_id 
	,upload_id 
	,is_required 
	,general_upload )
	SELECT wf_project_task_upload_id 
		,wf_project_task_id 
		,upload_id 
		,is_required 
		,general_upload
		FROM #ins

SELECT * FROM #ins
DROP TABLE #ins
