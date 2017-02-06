--Remove copy feature from Risk Analysis

UPDATE a_WF_TASK
	SET is_copy_allowed = 0
	WHERE id = 72