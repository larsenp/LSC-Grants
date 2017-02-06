--Correct join from a_WF_TASK to LSC_a_WF_TASK

ALTER VIEW [dbo].[vLSC_GARTRACKING_EL]


AS

SELECT 	wfta.wf_task_assignment_id,
		o.organization_id,
		o.legacy_organization_id,
		o.organization_name,
		wcy.wfta_year,
		c.program_id,
		c.description service_area,
		wfp.description,
		wfta.wf_task_id,
		wft.description wf_task,
		wfta.wf_task_status_id,
		wfts.description wf_task_status,
		wfta.wf_task_outcome_id,
		wfto.description wf_task_outcome,
		gp.wf_project_id,
		wfp.competition_id,
        lgc.id Gar_cycle_id,
		lgc.abbr Gar_Cycle, 
		wfta.due_date, 
        lwft.PrintableView_PageKey,
		lwft.EditableView_PageKey
FROM WF_TASK_ASSIGNMENT wfta
		JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
        JOIN LSC_a_WF_Task lwft ON wft.id = lwft.wf_task_id
		JOIN a_WF_TASK_STATUS wfts ON wfta.wf_task_status_id = wfts.id
		LEFT JOIN a_WF_TASK_OUTCOME wfto ON wfta.wf_task_outcome_id = wfto.id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		LEFT JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		JOIN LSC_c_GAR_CYCLE lgc ON wcy.report_cycle_year = lgc.sort_order
	WHERE wft.wf_task_type_id = 3 and c.program_id = 1 

