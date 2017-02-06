DELETE FROM  a_wf_task WHERE id = 84

UPDATE s_ID_GEN
	SET next_id = 84
	WHERE table_name = 'a_wf_task'