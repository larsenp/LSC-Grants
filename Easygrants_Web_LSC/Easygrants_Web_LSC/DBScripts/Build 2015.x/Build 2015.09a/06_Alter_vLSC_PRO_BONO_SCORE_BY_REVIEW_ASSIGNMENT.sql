ALTER VIEW [dbo].[vLSC_PRO_BONO_SCORE_BY_REVIEW_ASSIGNMENT]

AS

SELECT wfta.grantee_project_id
	,pbssra.wf_task_assignment_id
	,pbssra.raw_score
	,pbssra.weighted_score
	,pbssra.max_score
	,CASE wfp.time_period_id WHEN 19 THEN 0.4 
		WHEN 20 THEN 0.16 END review_weight
	FROM vLSC_PRO_BONO_SECONDARY_SCORE_BY_REVIEW_ASSIGNMENT pbssra
		JOIN WF_TASK_ASSIGNMENT wfta ON pbssra.wf_task_assignment_id = wfta.wf_task_assignment_id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
	WHERE wfta.wf_task_id = 107

UNION ALL

SELECT wfta.grantee_project_id
	,pbpsra.wf_task_assignment_id
	,pbpsra.raw_score
	,pbpsra.weighted_score
	,pbpsra.max_score
	,CASE wfp.time_period_id WHEN 19 THEN 0.3 
		WHEN 20 THEN 0.36 END review_weight
	FROM vLSC_PRO_BONO_PRIMARY_SCORE_BY_REVIEW_ASSIGNMENT pbpsra
		JOIN WF_TASK_ASSIGNMENT wfta ON pbpsra.wf_task_assignment_id = wfta.wf_task_assignment_id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
