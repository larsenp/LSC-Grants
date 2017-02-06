--Remove Prior TIG Awards form from TIG application
--Mantis 2863

DELETE a_WF_TASK_MODULE_CONFIG_NAVELEMENT
	WHERE wf_task_id = 41
		AND nav_key = 'PriorTIGAwards'
