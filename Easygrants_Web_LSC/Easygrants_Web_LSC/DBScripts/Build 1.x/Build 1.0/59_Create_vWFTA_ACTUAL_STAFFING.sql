CREATE VIEW vWFTA_ACTUAL_STAFFING

AS

SELECT wfta.wf_task_assignment_id,
	sc.description staff_category,
	las.supervising_attys,
	las.other_attys,
	las.paralegals,
	las.other_staff
	FROM (WF_TASK_ASSIGNMENT wfta
		CROSS JOIN LSC_C_STAFF_CATEGORY sc)
		LEFT JOIN LSC_ACTUAL_STAFFING las ON wfta.wf_task_assignment_id = las.wf_task_assignment_id
			AND sc.id = las.lsc_staff_category_id
