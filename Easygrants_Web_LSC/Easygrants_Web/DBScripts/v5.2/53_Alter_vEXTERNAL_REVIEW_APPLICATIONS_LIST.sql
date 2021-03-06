/****** Object:  View [dbo].[vEXTERNAL_REVIEW_APPLICATIONS_LIST]    Script Date: 11/10/2008 11:34:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vEXTERNAL_REVIEW_APPLICATIONS_LIST]
AS
SELECT     wftar.wf_task_assignment_id AS RevWftaID, wftar.wf_task_id AS RevWfTaskID, wftar.wf_task_status_id AS RevWfTaskStatusID, 
                      wftar.person_id AS ReviewerID, wftar.grantee_project_id AS GranteeProjectID, wftaa.wf_task_assignment_id AS AppWftaID, 
                      pa.name_last + ', ' + pa.name_first + ISNULL(' ' + pa.name_middle, '') AS ApplicantName, wftar.review_rating AS ReviewRating, 
                      dbo.WF_TASK_ASSIGNMENT_REVIEW.comments, wftar.review_cycle_stage_id, dbo.a_WF_PROJECT_TASK.id AS WfProjectTaskID, gprs.rank as AppRank, 
                      gprs.average_rating as AvgRating
FROM         dbo.WF_TASK_ASSIGNMENT AS wftar INNER JOIN
                      dbo.GRANTEE_PROJECT AS gp ON wftar.grantee_project_id = gp.grantee_project_id INNER JOIN
                      dbo.PERSON AS pa ON gp.primary_person_id = pa.person_id INNER JOIN
                      dbo.WF_TASK_ASSIGNMENT AS wftaa ON gp.grantee_project_id = wftaa.grantee_project_id AND gp.primary_person_id = wftaa.person_id INNER JOIN
                      dbo.a_WF_PROJECT_TASK ON wftaa.wf_task_id = dbo.a_WF_PROJECT_TASK.wf_task_id AND 
                      gp.wf_project_id = dbo.a_WF_PROJECT_TASK.wf_project_id INNER JOIN
                      dbo.GRANTEE_PROJECT_REVIEW_STAGE AS gprs ON gp.grantee_project_id = gprs.grantee_project_id LEFT OUTER JOIN
                      dbo.WF_TASK_ASSIGNMENT_REVIEW ON wftar.wf_task_assignment_id = dbo.WF_TASK_ASSIGNMENT_REVIEW.wf_task_assignment_id
WHERE     (wftaa.wf_task_role_id = 1) AND (wftar.wf_task_role_id = 7)
