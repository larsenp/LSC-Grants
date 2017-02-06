ALTER TABLE LSC_a_WF_TASK
	ADD lsc_board_info_source_id INT NULL

GO

UPDATE LSC_a_WF_TASK
	SET lsc_board_info_source_id = 1
	WHERE wf_task_id in (2,4,66,67)

UPDATE LSC_a_WF_TASK
	SET lsc_board_info_source_id = 2
	WHERE wf_task_id = 1

DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'LSC_a_WF_TASK'

INSERT LSC_a_WF_TASK
	(id
	,wf_task_id
	,lsc_board_info_source_id)
	VALUES
		(@new_id
		,89
		,3)
