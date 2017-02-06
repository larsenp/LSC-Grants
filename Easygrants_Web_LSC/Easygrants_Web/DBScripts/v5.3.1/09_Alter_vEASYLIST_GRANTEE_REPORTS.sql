/*
Developer		: 	Vikram Kumar Alle
Date			:	04/10/2009
Modification		:	GRANTEE_PROJECT primary_person_id joined with WF_TASK_ASSIGNMENT person_id so I have updated it to 
							 join with grantee_project_id
*/
/****** Object:  View [dbo].[vEASYLIST_GRANTEE_REPORTS]    Script Date: 04/10/2009 12:07:51 ******/
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
                          (SELECT TOP 1 (SELECT     organization_name
                                                    FROM         dbo.ORGANIZATION AS O
                                                    WHERE     (organization_id = POA.organization_id)) AS primary_organization_name
                            FROM          dbo.PERSON_ORGANIZATION_AFFILIATION AS POA
                            WHERE      (is_primary = 1) AND (person_id = dbo.PERSON.person_id)) AS primary_organization_name,
                          (SELECT TOP 1 (SELECT     common_organization_name
                                                    FROM         dbo.ORGANIZATION AS O
                                                    WHERE     (organization_id = POA.organization_id)) AS primary_common_organization_name
                            FROM          dbo.PERSON_ORGANIZATION_AFFILIATION AS POA
                            WHERE      (is_primary = 1) AND (person_id = dbo.PERSON.person_id)) AS primary_common_organization_name,
                          (SELECT TOP 1 (SELECT     organization_id
                                                    FROM         dbo.ORGANIZATION AS O
                                                    WHERE     (organization_id = POA.organization_id)) AS primary_organization_id
                            FROM          dbo.PERSON_ORGANIZATION_AFFILIATION AS POA
                            WHERE      (is_primary = 1) AND (person_id = dbo.PERSON.person_id)) AS primary_organization_id,
                          (SELECT TOP 1 email_addr
                            FROM          dbo.EMAIL AS E
                            WHERE      (is_primary = 1) AND (entity_id = dbo.PERSON.person_id)) AS primary_email_addr, 
                      dbo.a_WF_TASK_OUTCOME.id AS wf_task_outcome_id, dbo.a_WF_TASK.id AS wf_task_id, dbo.a_WF_TASK_ROLE.id AS wf_task_role_id, 
                      dbo.a_WF_TASK_STATUS.id AS wf_task_status_id, dbo.GRANTEE_PROJECT.wf_project_id, dbo.GRANTEE_PROJECT.legacy_grant_id, 
                      dbo.a_WF_PROJECT.competition_id, dbo.a_COMPETITION.program_id, dbo.a_COMPETITION.description AS competition_display_name, 
                      dbo.a_WF_TASK_ROLE.task_type_id AS wf_task_type_id, dbo.GRANTEE_PROJECT.grantee_project_id, 
                      dbo.WF_TASK_ASSIGNMENT.wf_task_assignment_id AS pdf_wfta_id
FROM  dbo.WF_TASK_ASSIGNMENT
	 LEFT OUTER JOIN dbo.GRANTEE_PROJECT ON dbo.GRANTEE_PROJECT.grantee_project_id = dbo.WF_TASK_ASSIGNMENT.grantee_project_id
	 LEFT OUTER JOIN dbo.PERSON ON dbo.WF_TASK_ASSIGNMENT.person_id = dbo.PERSON.person_id
	 LEFT OUTER JOIN dbo.a_WF_TASK ON dbo.WF_TASK_ASSIGNMENT.wf_task_id = dbo.a_WF_TASK.id
	 LEFT OUTER JOIN dbo.a_WF_PROJECT ON dbo.a_WF_PROJECT.id = dbo.GRANTEE_PROJECT.wf_project_id
     LEFT OUTER JOIN dbo.a_WF_TASK_ROLE ON  dbo.a_WF_TASK_ROLE.id = dbo.WF_TASK_ASSIGNMENT.wf_task_role_id
     LEFT OUTER JOIN dbo.a_COMPETITION ON    dbo.a_COMPETITION.id = dbo.a_WF_PROJECT.competition_id
     LEFT OUTER JOIN dbo.a_WF_TASK_OUTCOME ON   dbo.WF_TASK_ASSIGNMENT.wf_task_outcome_id = dbo.a_WF_TASK_OUTCOME.id
      LEFT OUTER JOIN dbo.a_WF_TASK_STATUS ON   dbo.WF_TASK_ASSIGNMENT.wf_task_status_id = dbo.a_WF_TASK_STATUS.id

WHERE     (dbo.a_WF_TASK_ROLE.task_type_id = 3) 

GO

