DECLARE @new_id INT

EXEC @new_id = getid_sel
	@table = 'LSC_a_WF_TASK_UPLOAD'
	,@mode = 2

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES
		(@new_id
		,102
		,80
		,0)