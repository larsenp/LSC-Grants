CREATE VIEW vLSC_EXTERNAL_REVIEW_APPLICATIONS_LIST

AS

SELECT wftar.wf_task_assignment_id AS RevWftaID, 
	wftar.wf_task_id AS RevWfTaskID, 
	wftar.wf_task_status_id AS RevWfTaskStatusID, 
    wftar.person_id AS ReviewerID, 
	wftar.grantee_project_id AS GranteeProjectID, 
	wftaa.wf_task_assignment_id AS AppWftaID, 
	wftaa.wf_task_id AS AppWfTaskID,
    pa.name_last + ', ' + pa.name_first + ISNULL(' ' + pa.name_middle, '') AS ApplicantName, 
	wftar.review_rating AS ReviewRating, 
	wftarev.comments, 
	wftar.review_cycle_stage_id, 
	review_cycle_id, 
	dbo.a_WF_PROJECT_TASK.id AS WfProjectTaskID, 
	gprs.rank as AppRank, 
	gprs.average_rating as AvgRating, 
	crat.description as ReviewerRole
	FROM dbo.WF_TASK_ASSIGNMENT AS wftar 
		INNER JOIN dbo.GRANTEE_PROJECT AS gp ON wftar.grantee_project_id = gp.grantee_project_id 
		INNER JOIN dbo.PERSON AS pa ON gp.primary_person_id = pa.person_id 
		INNER JOIN dbo.WF_TASK_ASSIGNMENT AS wftaa ON gp.grantee_project_id = wftaa.grantee_project_id 
		INNER JOIN a_WF_TASK wft ON wftaa.wf_task_id = wft.id
			AND wft.wf_task_type_id = 1
		INNER JOIN dbo.a_WF_PROJECT_TASK ON wftaa.wf_task_id = dbo.a_WF_PROJECT_TASK.wf_task_id 
			AND gp.wf_project_id = dbo.a_WF_PROJECT_TASK.wf_project_id 
		INNER JOIN dbo.GRANTEE_PROJECT_REVIEW_STAGE AS gprs ON gp.grantee_project_id = gprs.grantee_project_id 
			and wftar.review_cycle_stage_id = gprs.review_cycle_stage_id  
			and app_wf_task_assignment_id = wftaa.wf_task_assignment_id
		INNER JOIN REVIEW_CYCLE_STAGE AS rcs on wftar.review_cycle_stage_id = rcs.review_cycle_stage_id
		LEFT OUTER JOIN dbo.WF_TASK_ASSIGNMENT_REVIEW wftarev ON wftar.wf_task_assignment_id = wftarev.wf_task_assignment_id
		LEFT OUTER JOIN c_REVIEW_ASSIGNMENT_TYPE as crat on wftar.review_assignment_type_id = crat.id
	WHERE (wftar.wf_task_role_id = 7)  
