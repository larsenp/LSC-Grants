DELETE LSC_a_WF_TASK_UPLOAD
	WHERE wf_task_id = 2
		AND upload_id in (2, 7)

DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'LSC_a_WF_TASK_UPLOAD'

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES(@new_id
	,2
	,31
	,0)

EXEC @new_id = getid_sel @table = 'LSC_a_WF_TASK_UPLOAD'

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES(@new_id
	,2
	,32
	,0)

EXEC @new_id = getid_sel @table = 'LSC_a_WF_TASK_UPLOAD'

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES(@new_id
	,2
	,33
	,0)

EXEC @new_id = getid_sel @table = 'LSC_a_WF_TASK_UPLOAD'

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES(@new_id
	,2
	,34
	,0)

EXEC @new_id = getid_sel @table = 'LSC_a_WF_TASK_UPLOAD'

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES(@new_id
	,2
	,35
	,0)

EXEC @new_id = getid_sel @table = 'LSC_a_WF_TASK_UPLOAD'

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES(@new_id
	,2
	,36
	,0)

EXEC @new_id = getid_sel @table = 'LSC_a_WF_TASK_UPLOAD'

INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,general_upload)
	VALUES(@new_id
	,2
	,37
	,0)