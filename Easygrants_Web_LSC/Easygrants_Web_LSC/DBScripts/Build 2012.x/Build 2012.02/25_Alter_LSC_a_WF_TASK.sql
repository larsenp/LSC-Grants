ALTER TABLE LSC_a_WF_TASK
	ADD is_nic_data BIT NULL

GO

UPDATE LSC_a_WF_TASK
	SET is_nic_data = 1
	WHERE wf_task_id = 1

UPDATE LSC_a_WF_TASK
	SET is_nic_data = 0
	WHERE wf_task_id in (2,4)

DECLARE @new_id INT

EXEC @new_id = getid_sel @table='LSC_a_WF_TASK'

INSERT LSC_a_WF_TASK
	(id, wf_task_id, is_projected, is_nic_data)
	VALUES(@new_id, 66, 0, 0)

EXEC @new_id = getid_sel @table='LSC_a_WF_TASK'

INSERT LSC_a_WF_TASK
	(id, wf_task_id, is_projected, is_nic_data)
	VALUES(@new_id, 67, 0, 0)

