--Remove Prior TIG Awards form from TIG application Review
--Mantis 2889

DELETE a_WF_TASK_MODULE_CONFIG_NAVELEMENT
	WHERE wf_task_id = 43
		AND nav_key = 'PriorTIGAwards'




