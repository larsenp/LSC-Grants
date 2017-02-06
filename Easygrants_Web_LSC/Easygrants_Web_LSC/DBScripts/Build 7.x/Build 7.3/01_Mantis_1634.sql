update a_wf_project_task
	set workflow_type_id = 4
	from a_wf_project_task wfpt
		join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		join c_time_period tp on wfp.time_period_id = tp.id
		join a_wf_task wft on wfpt.wf_task_id = wft.id
	where tp.sort_order = 2009
		and wft.abbr = 'TIG Milestone Report'

INSERT a_CORRESPONDENCE_DEFINITION
	SELECT * FROM [LSC-EG5DEV].[Easygrants_TIG_Migration_Test].dbo.a_CORRESPONDENCE_DEFINITION
		WHERE correspondence_definition_id = 1001

UPDATE s_ID_GEN
	SET next_id = 1002
	WHERE table_name = 'a_CORRESPONDENCE_DEFINITION'