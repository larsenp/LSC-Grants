GO
/****** Object:  View [dbo].[vEASYLIST_APPLICATIONS]    Script Date: 12/24/2008 10:31:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vEASYLIST_APPLICATIONS]
AS
SELECT     TOP (100) PERCENT dbo.PERSON.name_last, dbo.PERSON.name_first, 
                      dbo.PERSON.name_last + ', ' + dbo.PERSON.name_first AS LastNameFirstName, dbo.a_WF_TASK_STATUS.description AS Status, 
                      dbo.a_WF_TASK_ROLE.description AS Role, dbo.a_WF_TASK_OUTCOME.description AS Outcome, dbo.a_WF_TASK.description AS Task, 
                      dbo.GRANTEE_PROJECT.grantee_project_id, dbo.GRANTEE_PROJECT.legacy_grant_id, dbo.a_WF_TASK_ROLE.task_type_id, 
                      dbo.WF_TASK_ASSIGNMENT.wf_task_assignment_id, dbo.WF_TASK_ASSIGNMENT.submitted_date, dbo.PERSON.person_id,
                          (SELECT     (SELECT     organization_name
                                                    FROM         dbo.ORGANIZATION AS O
                                                    WHERE     (organization_id = POA.organization_id)) AS primary_organization_name
                            FROM          dbo.PERSON_ORGANIZATION_AFFILIATION AS POA
                            WHERE      (is_primary = 1) AND (person_id = dbo.PERSON.person_id)) AS primary_organization_name,
                          (SELECT     (SELECT     common_organization_name
                                                    FROM         dbo.ORGANIZATION AS O
                                                    WHERE     (organization_id = POA.organization_id)) AS common_organization_name
                            FROM          dbo.PERSON_ORGANIZATION_AFFILIATION AS POA
                            WHERE      (is_primary = 1) AND (person_id = dbo.PERSON.person_id)) AS common_organization_name,
                          (SELECT     (SELECT     organization_id
                                                    FROM         dbo.ORGANIZATION AS O
                                                    WHERE     (organization_id = POA.organization_id)) AS primary_organization_id
                            FROM          dbo.PERSON_ORGANIZATION_AFFILIATION AS POA
                            WHERE      (is_primary = 1) AND (person_id = dbo.PERSON.person_id)) AS primary_organization_id,
                          (SELECT     email_addr
                            FROM          dbo.EMAIL AS E
                            WHERE      (is_primary = 1) AND (entity_id = dbo.PERSON.person_id) AND (entity_type_id = 1)) AS primary_email_addr, 
                      dbo.a_WF_TASK_OUTCOME.id AS wf_task_outcome_id, dbo.a_WF_TASK.id AS wf_task_id, dbo.a_WF_TASK_ROLE.id AS wf_task_role_id, 
                      dbo.a_WF_TASK_STATUS.id AS wf_task_status_id, dbo.GRANTEE_PROJECT.wf_project_id, dbo.a_WF_PROJECT.competition_id, 
                      dbo.a_COMPETITION.program_id, 
                      (CASE a_WF_TASK_ROLE.task_type_id WHEN 7 THEN WF_TASK_ASSIGNMENT.app_wfta_id ELSE WF_TASK_ASSIGNMENT.wf_task_assignment_id END)
                       AS pdf_wfta_id, dbo.a_WF_PROJECT_TASK.description AS project_task_description
FROM         dbo.WF_TASK_ASSIGNMENT INNER JOIN
                      dbo.a_WF_TASK ON dbo.WF_TASK_ASSIGNMENT.wf_task_id = dbo.a_WF_TASK.id INNER JOIN
                      dbo.GRANTEE_PROJECT ON dbo.WF_TASK_ASSIGNMENT.grantee_project_id = dbo.GRANTEE_PROJECT.grantee_project_id INNER JOIN
                      dbo.a_WF_PROJECT ON dbo.a_WF_PROJECT.id = dbo.GRANTEE_PROJECT.wf_project_id INNER JOIN
                      dbo.a_WF_PROJECT_TASK ON dbo.WF_TASK_ASSIGNMENT.wf_task_id = dbo.a_WF_PROJECT_TASK.wf_task_id AND 
                      dbo.GRANTEE_PROJECT.wf_project_id = dbo.a_WF_PROJECT_TASK.wf_project_id LEFT OUTER JOIN
                      dbo.PERSON ON dbo.WF_TASK_ASSIGNMENT.person_id = dbo.PERSON.person_id INNER JOIN
                      dbo.a_COMPETITION ON dbo.a_WF_PROJECT.competition_id = dbo.a_COMPETITION.id LEFT OUTER JOIN
                      dbo.a_WF_TASK_STATUS ON dbo.WF_TASK_ASSIGNMENT.wf_task_status_id = dbo.a_WF_TASK_STATUS.id LEFT OUTER JOIN
                      dbo.a_WF_TASK_OUTCOME ON dbo.a_WF_TASK_OUTCOME.id = dbo.WF_TASK_ASSIGNMENT.wf_task_outcome_id LEFT OUTER JOIN
                      dbo.a_WF_TASK_ROLE ON dbo.WF_TASK_ASSIGNMENT.wf_task_role_id = dbo.a_WF_TASK_ROLE.id
WHERE     (dbo.a_WF_TASK_ROLE.task_type_id = 1) OR
                      (dbo.a_WF_TASK_ROLE.task_type_id = 5) OR
                      (dbo.a_WF_TASK_ROLE.task_type_id = 6) OR
                      (dbo.a_WF_TASK_ROLE.task_type_id = 7)
