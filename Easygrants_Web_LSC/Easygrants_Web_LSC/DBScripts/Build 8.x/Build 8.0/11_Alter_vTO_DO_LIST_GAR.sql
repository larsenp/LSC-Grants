/****** Object:  View [dbo].[vTO_DO_LIST_GAR]    Script Date: 01/07/2010 15:35:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vTO_DO_LIST_GAR]

AS

SELECT wfta.wf_task_assignment_id,
	wfta.person_id,
	wfts.description [status],
	wft.description task,
	fn.full_form_number,
	fn.form_name,
	'Submit Form ' + fn.full_form_number + ' (' + fn.form_name + ')' form,
	wft.sort_order task_sort_order,
	c.description service_area,
	sa.service_area_type_id,
	wcy.wfta_year,
	wfta.open_date,
	wfta.due_date,
	wfta.close_date,
	wfta.end_date,
	CASE WHEN lwft.is_projected = 1 THEN wcy.wfta_year - 1
		ELSE wcy.wfta_year END AS report_cycle_year,
	wftm.module_name,
	wftm.module_config_filename
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
		JOIN LSC_a_WF_TASK lwft ON wfta.wf_task_id = lwft.wf_task_id
		JOIN a_WF_TASK_STATUS wfts ON wfta.wf_task_status_id = wfts.id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN LSC_a_SERVICE_AREA sa ON c.id = sa.competition_id
		JOIN vWFTA_COMPETITION_YEAR wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		JOIN vFORM_NAME fn ON wfta.wf_task_assignment_id = fn.wf_task_assignment_id
		JOIN a_WF_TASK_MODULE wftm ON wfta.wf_task_id = wftm.wf_task_id
			AND wfta.wf_task_role_id = wftm.wf_task_role_id
	WHERE wft.wf_task_type_id = 3
		AND wfta.wf_task_status_id <> 3
		AND c.program_id = 1
