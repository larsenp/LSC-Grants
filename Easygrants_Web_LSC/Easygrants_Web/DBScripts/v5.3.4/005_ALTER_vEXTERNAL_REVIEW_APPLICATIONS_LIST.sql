/*
Developer : Harish Avula
Date : 12/17/2009
Modification : Mantis 0009418: Submit Review Ranking – Collaborative Grant. "No reviewer task" displays on the Review Scores page. 
			   Changes in View include:
			   Removed the join condition on:  "AND gp.primary_person_id = wftaa.person_id"
											   "AND gprs.app_wf_task_assignment_id = wftaa.wf_task_assignment_id"
*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vEXTERNAL_REVIEW_APPLICATIONS_LIST]
AS
SELECT     wftar.wf_task_assignment_id AS RevWftaID, wftar.wf_task_id AS RevWfTaskID, wftar.wf_task_status_id AS RevWfTaskStatusID, 
                      wftar.person_id AS ReviewerID, wftar.grantee_project_id AS GranteeProjectID, wftaa.wf_task_assignment_id AS AppWftaID, 
                      wftaa.wf_task_id AS AppWfTaskID, pa.name_last + ', ' + pa.name_first + ISNULL(' ' + pa.name_middle, '') AS ApplicantName, 
                      CASE WHEN pa.suffix_id IS NULL THEN pa.name_last + ', ' + pa.name_first + ISNULL(' ' + pa.name_middle, '') 
                      ELSE pa.name_last + ', ' + pa.name_first + ISNULL(' ' + pa.name_middle, '') + ', ' + c_SUFFIX.suffix END AS ApplicantNameWithSuffix, 
                      wftar.review_rating AS ReviewRating, wftarev.comments, wftarev.public_critique, wftar.review_cycle_stage_id, rcs.review_cycle_id, 
                      dbo.a_WF_PROJECT_TASK.id AS WfProjectTaskID, gprs.rank AS AppRank, gprs.average_rating AS AvgRating, crat.description AS ReviewerRole
FROM         dbo.WF_TASK_ASSIGNMENT AS wftar INNER JOIN
                      dbo.GRANTEE_PROJECT AS gp ON wftar.grantee_project_id = gp.grantee_project_id INNER JOIN
                      dbo.PERSON AS pa ON gp.primary_person_id = pa.person_id INNER JOIN
                      dbo.WF_TASK_ASSIGNMENT AS wftaa ON gp.grantee_project_id = wftaa.grantee_project_id LEFT OUTER JOIN
                      dbo.c_SUFFIX ON pa.suffix_id = dbo.c_SUFFIX.suffix_id INNER JOIN
                      dbo.a_WF_PROJECT_TASK ON wftaa.wf_task_id = dbo.a_WF_PROJECT_TASK.wf_task_id AND 
                      gp.wf_project_id = dbo.a_WF_PROJECT_TASK.wf_project_id INNER JOIN
                      dbo.GRANTEE_PROJECT_REVIEW_STAGE AS gprs ON gp.grantee_project_id = gprs.grantee_project_id AND 
                      wftar.review_cycle_stage_id = gprs.review_cycle_stage_id INNER JOIN
                      dbo.REVIEW_CYCLE_STAGE AS rcs ON wftar.review_cycle_stage_id = rcs.review_cycle_stage_id LEFT OUTER JOIN
                      dbo.WF_TASK_ASSIGNMENT_REVIEW AS wftarev ON wftar.wf_task_assignment_id = wftarev.wf_task_assignment_id LEFT OUTER JOIN
                      dbo.c_REVIEW_ASSIGNMENT_TYPE AS crat ON wftar.review_assignment_type_id = crat.id
WHERE     (wftaa.wf_task_role_id = 1) AND (wftar.wf_task_role_id = 7)

GO