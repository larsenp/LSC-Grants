--Create is_pai column to designate tasks that apply to PAI only (and thus should be assigned only to Basic Field service areas)
ALTER TABLE LSC_a_WF_TASK
	ADD is_pai BIT NULL

GO

UPDATE LSC_a_WF_TASK
	SET is_pai = 0
	FROM LSC_a_WF_TASK lwft
		JOIN a_WF_TASK wft ON lwft.wf_task_id = wft.id
	WHERE wft.wf_task_type_id = 3

UPDATE LSC_a_WF_TASK
	SET is_pai = 1
	WHERE id in (11, 14, 15, 22, 23)

--Create assign_report_per_service_area column to designate which reports are to be assigned per service area as opposed to once per year per grantee.
ALTER TABLE LSC_a_WF_TASK
	ADD assign_report_per_service_area BIT NULL

GO

UPDATE LSC_a_WF_TASK
	SET assign_report_per_service_area = 1
	FROM LSC_a_WF_TASK lwft
		JOIN a_WF_TASK wft ON lwft.wf_task_id = wft.id
	WHERE wft.wf_task_type_id = 3

UPDATE LSC_a_WF_TASK
	SET assign_report_per_service_area = 0
	WHERE id in (16, 17, 18, 24, 25, 26, 27, 28, 29)