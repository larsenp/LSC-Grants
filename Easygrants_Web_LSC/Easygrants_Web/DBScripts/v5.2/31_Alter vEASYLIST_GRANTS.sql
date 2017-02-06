
GO
/****** Object:  View [dbo].[vEASYLIST_GRANTS]    Script Date: 09/29/2008 11:23:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vEASYLIST_GRANTS]
AS
SELECT DISTINCT 
                      Grantee.person_id, Grantee.name_last AS LastName, Grantee.name_first AS FirstName, 
                      Grantee.name_last + ', ' + Grantee.name_first AS LastNameFirstName, dbo.c_GRANT_STATUS.abbr, dbo.ORGANIZATION.organization_name, 
                      dbo.ORGANIZATION.organization_id, dbo.a_WF_PROJECT.description AS project_name, Grantee.name_middle, 
                      dbo.PERSON_ORGANIZATION_AFFILIATION.institutional_component,
                          (SELECT     email_addr
                            FROM          dbo.EMAIL AS E
                            WHERE      (is_primary = 1) AND (entity_id = Grantee.person_id) AND (entity_type_id = 1)) AS primary_email_addr, dbo.a_COMPETITION.program_id, 
                      dbo.a_WF_PROJECT.competition_id, dbo.GRANTEE_PROJECT.wf_project_id, dbo.GRANTEE_PROJECT.grant_status_id,
                          (SELECT     (SELECT     organization_name
                                                    FROM         dbo.ORGANIZATION AS O
                                                    WHERE     (organization_id = POA.organization_id)) AS primary_organization_name
                            FROM          dbo.PERSON_ORGANIZATION_AFFILIATION AS POA
                            WHERE      (is_primary = 1) AND (person_id = Grantee.person_id)) AS primary_organization_name, dbo.GRANTEE_PROJECT.grantee_project_id, 
                      dbo.a_WF_TASK.id AS wf_task_id, dbo.a_WF_TASK.wf_task_type_id, dbo.GRANTEE_PROJECT.wf_project_outcome_id, 
                      dbo.WF_TASK_ASSIGNMENT.wf_task_outcome_id, dbo.a_PROGRAM.abbr AS ProgramName, dbo.a_WF_PROJECT.time_period_id AS TimePeriodID, 
                      PrimaryStaff.name_last AS PrimaryLastName, PrimaryStaff.name_first AS PrimaryFirstName, 
                      PrimaryStaff.name_last + ', ' + PrimaryStaff.name_first AS PrimaryLastNameFirstName, PrimaryStaff.person_id AS PrimaryPersonID, 
                      dbo.GRANTEE_PROJECT.grant_title AS ProjectTitle, dbo.GRANTEE_PROJECT.grant_description AS ProjectDesc, 
                      dbo.GRANTEE_PROJECT.legacy_grant_id, dbo.a_FUND.fund_id, dbo.a_FUND.fund_name
FROM         dbo.WF_TASK_ASSIGNMENT LEFT OUTER JOIN
                      dbo.a_WF_TASK ON dbo.a_WF_TASK.id = dbo.WF_TASK_ASSIGNMENT.wf_task_id RIGHT OUTER JOIN
                      dbo.GRANTEE_PROJECT INNER JOIN
                      dbo.c_GRANT_STATUS ON dbo.GRANTEE_PROJECT.grant_status_id = dbo.c_GRANT_STATUS.id ON 
                      dbo.WF_TASK_ASSIGNMENT.grantee_project_id = dbo.GRANTEE_PROJECT.grantee_project_id LEFT OUTER JOIN
                      dbo.ORGANIZATION ON dbo.GRANTEE_PROJECT.primary_organization_id = dbo.ORGANIZATION.organization_id LEFT OUTER JOIN
                      dbo.PERSON_ORGANIZATION_AFFILIATION ON dbo.ORGANIZATION.organization_id = dbo.PERSON_ORGANIZATION_AFFILIATION.organization_id AND 
                      dbo.GRANTEE_PROJECT.primary_person_id = dbo.PERSON_ORGANIZATION_AFFILIATION.person_id LEFT OUTER JOIN
                      dbo.a_PROGRAM INNER JOIN
                      dbo.a_COMPETITION INNER JOIN
                      dbo.a_WF_PROJECT ON dbo.a_COMPETITION.id = dbo.a_WF_PROJECT.competition_id ON 
                      dbo.a_PROGRAM.id = dbo.a_COMPETITION.program_id LEFT OUTER JOIN
                      dbo.a_FUND ON dbo.a_WF_PROJECT.fund_id = dbo.a_FUND.fund_id ON 
                      dbo.GRANTEE_PROJECT.wf_project_id = dbo.a_WF_PROJECT.id LEFT OUTER JOIN
                      dbo.PERSON AS Grantee ON dbo.GRANTEE_PROJECT.primary_person_id = Grantee.person_id LEFT OUTER JOIN
                      dbo.GRANTEE_PROJECT_STAFF_AFFILIATION ON 
                      dbo.GRANTEE_PROJECT.grantee_project_id = dbo.GRANTEE_PROJECT_STAFF_AFFILIATION.grantee_project_id AND 
                      dbo.GRANTEE_PROJECT_STAFF_AFFILIATION.is_primary = 1 LEFT OUTER JOIN
                      dbo.PERSON AS PrimaryStaff ON dbo.GRANTEE_PROJECT_STAFF_AFFILIATION.person_id = PrimaryStaff.person_id
