CREATE VIEW [dbo].[vLSC_TO_DO_LIST_TIG_FINAL_BUDGET]

AS

SELECT
	wfta.wf_task_assignment_id
	,wfta.person_id
	,gp.legacy_grant_id tig
	,gp.grant_status_id
	,wfta.open_date
	,wfta.due_date
	,wfta.close_date
	,wfta.end_date
	,wfts.description [status]
	,wftm.module_name
	,wftm.module_config_filename
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_TASK_STATUS wfts ON wfta.wf_task_status_id = wfts.id
		JOIN a_WF_TASK_MODULE wftm ON wfta.wf_task_id = wftm.wf_task_id
			AND wfta.wf_task_role_id = wftm.wf_task_role_id
	WHERE wfta.wf_task_id = 77
		AND gp.grant_status_id = 1