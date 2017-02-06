GO
/****** Object:  View [dbo].[vEASYLIST_GRANTEE_REPORTS]    Script Date: 12/24/2008 13:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vEASYLIST_GRANTEE_REPORTS]
AS
SELECT     TOP (100) PERCENT dbo.PERSON.name_last, dbo.PERSON.name_first, 
                      dbo.PERSON.name_last + ', ' + dbo.PERSON.name_first AS LastNameFirstName, dbo.a_WF_TASK_STATUS.description AS status, 
                      dbo.a_WF_TASK_ROLE.description AS role, dbo.a_WF_TASK_OUTCOME.description AS outcome, dbo.a_WF_TASK.description AS task, 
                      dbo.WF_TASK_ASSIGNMENT.wf_task_assignment_id, dbo.PERSON.person_id,
                          (SELECT     (SELECT     organization_name
                                                    FROM         dbo.ORGANIZATION AS O
                                                    WHERE     (organization_id = POA.organization_id)) AS primary_organization_name
                            FROM          dbo.PERSON_ORGANIZATION_AFFILIATION AS POA
                            WHERE      (is_primary = 1) AND (person_id = dbo.PERSON.person_id)) AS primary_organization_name,
                          (SELECT     (SELECT     common_organization_name
                                                    FROM         dbo.ORGANIZATION AS O
                                                    WHERE     (organization_id = POA.organization_id)) AS primary_common_organization_name
                            FROM          dbo.PERSON_ORGANIZATION_AFFILIATION AS POA
                            WHERE      (is_primary = 1) AND (person_id = dbo.PERSON.person_id)) AS primary_common_organization_name,
                          (SELECT     (SELECT     organization_id
                                                    FROM         dbo.ORGANIZATION AS O
                                                    WHERE     (organization_id = POA.organization_id)) AS primary_organization_id
                            FROM          dbo.PERSON_ORGANIZATION_AFFILIATION AS POA
                            WHERE      (is_primary = 1) AND (person_id = dbo.PERSON.person_id)) AS primary_organization_id,
                          (SELECT     email_addr
                            FROM          dbo.EMAIL AS E
                            WHERE      (is_primary = 1) AND (entity_id = dbo.PERSON.person_id)) AS primary_email_addr, 
                      dbo.a_WF_TASK_OUTCOME.id AS wf_task_outcome_id, dbo.a_WF_TASK.id AS wf_task_id, dbo.a_WF_TASK_ROLE.id AS wf_task_role_id, 
                      dbo.a_WF_TASK_STATUS.id AS wf_task_status_id, dbo.GRANTEE_PROJECT.wf_project_id, dbo.GRANTEE_PROJECT.legacy_grant_id, 
                      dbo.a_WF_PROJECT.competition_id, dbo.a_COMPETITION.program_id, dbo.a_COMPETITION.description AS competition_display_name, 
                      dbo.a_WF_TASK_ROLE.task_type_id AS wf_task_type_id, dbo.GRANTEE_PROJECT.grantee_project_id, 
                      dbo.WF_TASK_ASSIGNMENT.wf_task_assignment_id AS pdf_wfta_id
FROM         dbo.a_WF_TASK_ROLE RIGHT OUTER JOIN
                      dbo.a_COMPETITION RIGHT OUTER JOIN
                      dbo.a_WF_PROJECT ON dbo.a_COMPETITION.id = dbo.a_WF_PROJECT.competition_id RIGHT OUTER JOIN
                      dbo.GRANTEE_PROJECT RIGHT OUTER JOIN
                      dbo.WF_TASK_ASSIGNMENT ON dbo.GRANTEE_PROJECT.primary_person_id = dbo.WF_TASK_ASSIGNMENT.person_id ON 
                      dbo.a_WF_PROJECT.id = dbo.GRANTEE_PROJECT.wf_project_id LEFT OUTER JOIN
                      dbo.PERSON ON dbo.WF_TASK_ASSIGNMENT.person_id = dbo.PERSON.person_id ON 
                      dbo.a_WF_TASK_ROLE.id = dbo.WF_TASK_ASSIGNMENT.wf_task_role_id LEFT OUTER JOIN
                      dbo.a_WF_TASK_OUTCOME ON dbo.WF_TASK_ASSIGNMENT.wf_task_outcome_id = dbo.a_WF_TASK_OUTCOME.id LEFT OUTER JOIN
                      dbo.a_WF_TASK_STATUS ON dbo.WF_TASK_ASSIGNMENT.wf_task_status_id = dbo.a_WF_TASK_STATUS.id LEFT OUTER JOIN
                      dbo.a_WF_TASK ON dbo.WF_TASK_ASSIGNMENT.wf_task_id = dbo.a_WF_TASK.id
WHERE     (dbo.a_WF_TASK_ROLE.task_type_id = 3)
