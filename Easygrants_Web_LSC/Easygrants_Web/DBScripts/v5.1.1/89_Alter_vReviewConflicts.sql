ALTER	VIEW [dbo].[vReviewConflicts]
AS
SELECT DISTINCT TOP 100 PERCENT 
		WF_TASK_ASSIGNMENT.wf_task_id AS RevWfTaskID, 
		WF_TASK_ASSIGNMENT.person_id AS ReviewerID, 
		WF_TASK_ASSIGNMENT.wf_task_assignment_id AS RevWftaID, 
		WF_TASK_ASSIGNMENT.grantee_project_id AS GranteeProjectID, 
		WF_TASK_ASSIGNMENT_1.wf_task_assignment_id AS AppWftaID, 
		WF_TASK_ASSIGNMENT_1.wf_task_id AS AppWfTaskID, 
		PERSON.name_last + ', ' + PERSON.name_first AS ApplicantName,
		c_REQUEST_CONFLICT.description AS RequestConflict, 
		PERSON.person_id AS AppPersonID, 
		WF_TASK_ASSIGNMENT.review_conflict_type_id AS ConflictTypeID, 
		WF_TASK_ASSIGNMENT.review_preference_type_id AS RequestConflictID, 
		WF_TASK_ASSIGNMENT.wf_task_status_id AS WfTaskStatusID, 
		c_CONFLICT_TYPE.description As ConflictType, REVIEW_CYCLE_STAGE.review_cycle_id As ReviewCycleID
FROM	REVIEW_CYCLE_STAGE 
		INNER JOIN WF_TASK_ASSIGNMENT 
		INNER JOIN WF_TASK_ASSIGNMENT WF_TASK_ASSIGNMENT_1 ON WF_TASK_ASSIGNMENT.grantee_project_id = WF_TASK_ASSIGNMENT_1.grantee_project_id 
		INNER JOIN GRANTEE_PROJECT ON WF_TASK_ASSIGNMENT.grantee_project_id = GRANTEE_PROJECT.grantee_project_id 
		INNER JOIN PERSON ON GRANTEE_PROJECT.primary_person_id = PERSON.person_id 
		ON REVIEW_CYCLE_STAGE.review_cycle_stage_id = WF_TASK_ASSIGNMENT.review_cycle_stage_id 
		INNER JOIN REVIEW_CYCLE_PROJECT_TASK ON REVIEW_CYCLE_STAGE.review_cycle_id = REVIEW_CYCLE_PROJECT_TASK.review_cycle_id 
		INNER JOIN a_WF_PROJECT_TASK ON REVIEW_CYCLE_PROJECT_TASK.project_task_id = a_WF_PROJECT_TASK.id 
			AND WF_TASK_ASSIGNMENT_1.wf_task_id = a_WF_PROJECT_TASK.wf_task_id 
		LEFT OUTER JOIN c_CONFLICT_TYPE ON WF_TASK_ASSIGNMENT.review_conflict_type_id = c_CONFLICT_TYPE.id 
		LEFT OUTER JOIN c_REQUEST_CONFLICT ON WF_TASK_ASSIGNMENT.review_preference_type_id = c_REQUEST_CONFLICT.id
WHERE	WF_TASK_ASSIGNMENT.wf_task_role_id = 7
ORDER BY ApplicantName
