ALTER VIEW [dbo].[vLSC_SUBGRANT_REVIEW_DUE_DATES]

AS

SELECT ws.lsc_wfta_subgrant_id
	,ws.wf_task_assignment_id
	,wfta_req.grantee_project_id
	,DATEADD(d, 10, wfta_req.submitted_date) oce_aa_review_due
	,DATEADD(d, 16, wfta_req.submitted_date) opp_staff_review_due
	,DATEADD(d, 7, wfta_opp_staff.submitted_date) opp_director_review_due
	,DATEADD(d, 15, wfta_oce_aa.submitted_date) oce_staff_review_due
	,DATEADD(d, 9, wfta_oce_staff.submitted_date) oce_director_review_due
	FROM LSC_WFTA_SUBGRANT ws
		JOIN WF_TASK_ASSIGNMENT wfta_req ON ws.wf_task_assignment_id = wfta_req.wf_task_assignment_id
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_opp_staff ON wfta_req.grantee_project_id = wfta_opp_staff.grantee_project_id
			AND wfta_opp_staff.wf_task_id = 84
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_oce_aa ON wfta_req.grantee_project_id = wfta_oce_aa.grantee_project_id
			AND wfta_oce_aa.wf_task_id = 64
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_oce_staff ON wfta_req.grantee_project_id = wfta_oce_staff.grantee_project_id
			AND wfta_oce_staff.wf_task_id = 65
	WHERE wfta_req.wf_task_id = 53

UNION ALL

SELECT ws.lsc_wfta_subgrant_id
	,ws.wf_task_assignment_id
	,wfta_req.grantee_project_id
	,DATEADD(d, 14, wfta_req.submitted_date) oce_aa_review_due
	,DATEADD(d, 16, wfta_req.submitted_date) opp_staff_review_due
	,DATEADD(d, 7, wfta_opp_staff.submitted_date) opp_director_review_due
	,DATEADD(d, 60, wfta_req.submitted_date) oce_staff_review_due
	,NULL oce_director_review_due
	FROM LSC_WFTA_SUBGRANT ws
		JOIN WF_TASK_ASSIGNMENT wfta_req ON ws.wf_task_assignment_id = wfta_req.wf_task_assignment_id
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_opp_staff ON wfta_req.grantee_project_id = wfta_opp_staff.grantee_project_id
			AND wfta_opp_staff.wf_task_id = 105
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_oce_aa ON wfta_req.grantee_project_id = wfta_oce_aa.grantee_project_id
			AND wfta_oce_aa.wf_task_id = 104
	WHERE wfta_req.wf_task_id = 101

