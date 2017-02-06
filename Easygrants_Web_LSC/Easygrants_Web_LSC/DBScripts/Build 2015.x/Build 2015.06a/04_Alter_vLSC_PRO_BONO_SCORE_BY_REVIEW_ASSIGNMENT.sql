ALTER VIEW [dbo].[vLSC_PRO_BONO_SCORE_BY_REVIEW_ASSIGNMENT]

AS

SELECT wfta.grantee_project_id
	,pbssra.wf_task_assignment_id
	,pbssra.raw_score
	,pbssra.weighted_score
	,pbssra.max_score
	,0.4 review_weight
	FROM vLSC_PRO_BONO_SECONDARY_SCORE_BY_REVIEW_ASSIGNMENT pbssra
		JOIN WF_TASK_ASSIGNMENT wfta ON pbssra.wf_task_assignment_id = wfta.wf_task_assignment_id
	WHERE wfta.wf_task_id = 107

UNION ALL

SELECT wfta.grantee_project_id
	,pbpsra.wf_task_assignment_id
	,pbpsra.raw_score
	,pbpsra.weighted_score
	,pbpsra.max_score
	,0.3 review_weight
	FROM vLSC_PRO_BONO_PRIMARY_SCORE_BY_REVIEW_ASSIGNMENT pbpsra
		JOIN WF_TASK_ASSIGNMENT wfta ON pbpsra.wf_task_assignment_id = wfta.wf_task_assignment_id

