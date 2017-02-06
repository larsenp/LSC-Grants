GO
/****** Object:  View [dbo].[vMY_GRANTS]    Script Date: 10/21/2008 13:36:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vMY_GRANTS]
AS
SELECT DISTINCT 
                      Grantee.person_id, Grantee.name_last + ', ' + Grantee.name_first AS LastNameFirstName, dbo.GRANTEE_PROJECT.grantee_project_id, 
                      dbo.GRANTEE_PROJECT.grant_award_date, dbo.GRANTEE_PROJECT_INFO.award_amount, dbo.GRANTEE_PROJECT.wf_project_id, 
                      dbo.GRANTEE_PROJECT.legacy_grant_id, dbo.ORGANIZATION.organization_name, dbo.ORGANIZATION.organization_id, dbo.c_GRANT_STATUS.abbr, 
                      dbo.a_PROGRAM.abbr AS ProgramName, dbo.a_WF_PROJECT.description AS project_name, dbo.a_COMPETITION.description AS competition_name, 
                      dbo.GRANTEE_PROJECT.grant_title AS ProjectTitle, dbo.a_WF_PROJECT_OUTCOME.abbr AS ProjectOutcome, dbo.a_COMPETITION.program_id, 
                      dbo.a_WF_PROJECT.competition_id, dbo.GRANTEE_PROJECT.grant_status_id, dbo.GRANTEE_PROJECT.wf_project_outcome_id
FROM         dbo.GRANTEE_PROJECT LEFT OUTER JOIN
                      dbo.GRANTEE_PROJECT_INFO ON dbo.GRANTEE_PROJECT.grantee_project_id = dbo.GRANTEE_PROJECT_INFO.grantee_project_id LEFT OUTER JOIN
                      dbo.c_GRANT_STATUS ON dbo.GRANTEE_PROJECT.grant_status_id = dbo.c_GRANT_STATUS.id LEFT OUTER JOIN
                      dbo.PERSON AS Grantee ON dbo.GRANTEE_PROJECT.primary_person_id = Grantee.person_id LEFT OUTER JOIN
                      dbo.ORGANIZATION ON dbo.GRANTEE_PROJECT.primary_organization_id = dbo.ORGANIZATION.organization_id LEFT OUTER JOIN
                      dbo.a_WF_PROJECT_OUTCOME ON dbo.GRANTEE_PROJECT.wf_project_outcome_id = dbo.a_WF_PROJECT_OUTCOME.id LEFT OUTER JOIN
                      dbo.a_WF_PROJECT ON dbo.GRANTEE_PROJECT.wf_project_id = dbo.a_WF_PROJECT.id LEFT OUTER JOIN
                      dbo.a_COMPETITION ON dbo.a_COMPETITION.id = dbo.a_WF_PROJECT.competition_id LEFT OUTER JOIN
                      dbo.a_PROGRAM ON dbo.a_PROGRAM.id = dbo.a_COMPETITION.program_id
