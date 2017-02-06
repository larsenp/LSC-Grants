DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'LSC_a_WF_TASK_UPLOAD'

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES
		(@new_id
		,2
		,72
		,0)

EXEC @new_id = getid_sel @table = 'LSC_a_WF_TASK_UPLOAD'

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES
		(@new_id
		,4
		,72
		,0)

EXEC @new_id = getid_sel @table = 'LSC_a_WF_TASK_UPLOAD'

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES
		(@new_id
		,66
		,72
		,0)

EXEC @new_id = getid_sel @table = 'LSC_a_WF_TASK_UPLOAD'

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES
		(@new_id
		,67
		,72
		,0)