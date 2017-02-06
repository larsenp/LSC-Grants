DECLARE @new_id INT

EXEC @new_id = getid_sel @table='LSC_a_WF_TASK_UPLOAD'
	,@mode = 2

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES
		(@new_id
		,102
		,29
		,0)

EXEC @new_id = getid_sel @table='LSC_a_WF_TASK_UPLOAD'
	,@mode = 2

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES
		(@new_id
		,102
		,31
		,0)

EXEC @new_id = getid_sel @table='LSC_a_WF_TASK_UPLOAD'
	,@mode = 2

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES
		(@new_id
		,102
		,32
		,0)

EXEC @new_id = getid_sel @table='LSC_a_WF_TASK_UPLOAD'
	,@mode = 2

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES
		(@new_id
		,102
		,34
		,0)

EXEC @new_id = getid_sel @table='LSC_a_WF_TASK_UPLOAD'
	,@mode = 2

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES
		(@new_id
		,102
		,35
		,0)

EXEC @new_id = getid_sel @table='LSC_a_WF_TASK_UPLOAD'
	,@mode = 2

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES
		(@new_id
		,102
		,36
		,0)

EXEC @new_id = getid_sel @table='LSC_a_WF_TASK_UPLOAD'
	,@mode = 2

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES
		(@new_id
		,102
		,37
		,0)
