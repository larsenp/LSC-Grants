/****** Object:  View [dbo].[vTO_DO_LIST_GAR]    Script Date: 01/29/2013 16:51:24 ******/
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
	CASE WHEN fn.form_name IS NULL 
		THEN wft.description 
		ELSE 'Submit Form ' + fn.full_form_number + ' (' + fn.form_name + ')' END form,
	wft.sort_order task_sort_order,
	c.description service_area,
	sa.service_area_type_id,
	wcy.wfta_year,
	wfta.open_date,
	wfta.due_date,
	wfta.close_date,
	wfta.end_date,
	CASE WHEN lwft.lsc_gar_form_group_id = 2 THEN wcy.wfta_year - 1
		ELSE wcy.wfta_year END AS report_cycle_year,
	wftm.module_name,
	wftm.module_config_filename
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
		LEFT JOIN LSC_a_WF_TASK lwft ON wfta.wf_task_id = lwft.wf_task_id
		JOIN a_WF_TASK_STATUS wfts ON wfta.wf_task_status_id = wfts.id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN LSC_a_SERVICE_AREA sa ON c.id = sa.competition_id
		JOIN vWFTA_COMPETITION_YEAR wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		LEFT JOIN vFORM_NAME fn ON wfta.wf_task_assignment_id = fn.wf_task_assignment_id
		JOIN a_WF_TASK_MODULE wftm ON wfta.wf_task_id = wftm.wf_task_id
			AND wfta.wf_task_role_id = wftm.wf_task_role_id
	WHERE wft.wf_task_type_id = 3
		AND wfta.wf_task_status_id <> 3
		AND c.program_id = 1
