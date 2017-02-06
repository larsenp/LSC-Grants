CREATE VIEW [dbo].[vLSC_SUBGRANT_WFTAS_BY_STEP]

AS

SELECT CAST(gp.grantee_project_id AS VARCHAR(5)) + '_3' grantee_project_step_id --arbitrarily calling the old subgrant process "step 3" ("step 0" might run afoul of Easygrants filtering functionality)
	,gp.grantee_project_id
	,3 step
	,wfta_req.wf_task_assignment_id req_wfta_id
	,wfta_aa.wf_task_assignment_id aa_wfta_id
	,wfta_opps.wf_task_assignment_id opps_wfta_id
	,wfta_oppd.wf_task_assignment_id oppd_wfta_id
	,wfta_rc.wf_task_assignment_id rc_wfta_id
	,wfta_oced.wf_task_assignment_id oced_wfta_id
	FROM GRANTEE_PROJECT gp
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_req ON gp.grantee_project_id = wfta_req.grantee_project_id
			AND wfta_req.wf_task_id = 53
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_aa ON gp.grantee_project_id = wfta_aa.grantee_project_id
			AND wfta_aa.wf_task_id = 64
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_opps ON gp.grantee_project_id = wfta_opps.grantee_project_id
			AND wfta_opps.wf_task_id = 84
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_oppd ON gp.grantee_project_id = wfta_oppd.grantee_project_id
			AND wfta_oppd.wf_task_id = 85
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_rc ON gp.grantee_project_id = wfta_rc.grantee_project_id
			AND wfta_rc.wf_task_id = 65
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_oced ON gp.grantee_project_id = wfta_oced.grantee_project_id
			AND wfta_oced.wf_task_id = 86
	WHERE gp.wf_project_id = 2810

UNION ALL

SELECT CAST(gp.grantee_project_id AS VARCHAR(5)) + '_1' grantee_project_step_id
	,gp.grantee_project_id
	,1 step
	,wfta_req.wf_task_assignment_id req_wfta_id
	,wfta_aa.wf_task_assignment_id aa_wfta_id
	,wfta_opps.wf_task_assignment_id opps_wfta_id
	,wfta_oppd.wf_task_assignment_id oppd_wfta_id
	,wfta_rc.wf_task_assignment_id rc_wfta_id
	,NULL oced_wfta_id
	FROM GRANTEE_PROJECT gp
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_req ON gp.grantee_project_id = wfta_req.grantee_project_id
			AND wfta_req.wf_task_id = 101
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_aa ON gp.grantee_project_id = wfta_aa.grantee_project_id
			AND wfta_aa.wf_task_id = 104
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_opps ON gp.grantee_project_id = wfta_opps.grantee_project_id
			AND wfta_opps.wf_task_id = 105
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_oppd ON gp.grantee_project_id = wfta_oppd.grantee_project_id
			AND wfta_oppd.wf_task_id = 108
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_rc ON gp.grantee_project_id = wfta_rc.grantee_project_id
			AND wfta_rc.wf_task_id = 109
	WHERE gp.wf_project_id = 3116

UNION ALL

SELECT CAST(gp.grantee_project_id AS VARCHAR(5)) + '_2' grantee_project_step_id
	,gp.grantee_project_id
	,2 step
	,wfta_req.wf_task_assignment_id req_wfta_id
	,wfta_aa.wf_task_assignment_id aa_wfta_id
	,wfta_opps.wf_task_assignment_id opps_wfta_id
	,wfta_oppd.wf_task_assignment_id oppd_wfta_id
	,wfta_rc.wf_task_assignment_id rc_wfta_id
	,wfta_oced.wf_task_assignment_id oced_wfta_id
	FROM GRANTEE_PROJECT gp
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_req ON gp.grantee_project_id = wfta_req.grantee_project_id
			AND wfta_req.wf_task_id = 116
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_aa ON gp.grantee_project_id = wfta_aa.grantee_project_id
			AND wfta_aa.wf_task_id = 117
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_opps ON gp.grantee_project_id = wfta_opps.grantee_project_id
			AND wfta_opps.wf_task_id = 119
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_oppd ON gp.grantee_project_id = wfta_oppd.grantee_project_id
			AND wfta_oppd.wf_task_id = 120
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_rc ON gp.grantee_project_id = wfta_rc.grantee_project_id
			AND wfta_rc.wf_task_id = 118
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_oced ON gp.grantee_project_id = wfta_oced.grantee_project_id
			AND wfta_oced.wf_task_id = 121
	WHERE gp.wf_project_id = 3116
