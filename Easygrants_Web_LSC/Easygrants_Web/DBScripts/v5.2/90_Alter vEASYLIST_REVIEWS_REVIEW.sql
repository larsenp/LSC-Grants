ALTER VIEW [dbo].[vEASYLIST_REVIEWS_REVIEW]
AS
SELECT     WF_TASK_ASSIGNMENT.wf_task_assignment_id, PERSON.person_id, PERSON.name_last, PERSON.name_first, 
                      ORGANIZATION.organization_name AS primary_organization_name, APP_PERSON.name_last AS app_name_last, 
                      APP_PERSON.name_first AS app_name_first, APP_ORGANIZATION.organization_name AS app_organization_name, 
                      WF_TASK_ASSIGNMENT.review_committee_id, a_REVIEW_COMMITTEE.inactive, 
                      a_REVIEW_COMMITTEE.description AS review_committee_description, a_WF_PROJECT.id AS project_id, a_WF_PROJECT.competition_id, 
                      a_COMPETITION.competition_type_id, a_COMPETITION.program_id, a_PROGRAM.consortia_id, a_WF_PROJECT_TASK.id AS project_task_id, 
                      a_WF_PROJECT_TASK.description AS project_task_desc, a_REVIEW_CYCLE.time_period_id, 
                      dbo.vPERSON_NAMES.LastFirstMiddle AS LastNameFirstNameMiddle, vPERSON_NAMES_APP.LastFirstMiddle AS AppLastNameFirstName, 
                      vPERSON_NAMES_APP.person_id AS AppPersonID, vPERSON_NAMES_1.LastFirstMiddle AS LastNameFirstName, 
                      a_WF_TASK_STATUS.id AS task_status_id, a_WF_TASK_STATUS.description AS task_status_description, a_WF_TASK.id AS wf_task_id, 
                      dbo.vREVIEW_CYCLE_STAGE_TASK_ASSIGNMENTS_COUNT.task_assignments_count,
					ORGANIZATION.common_organization_name AS rev_common_organization_name, 
                      APP_ORGANIZATION.common_organization_name AS app_common_organization_name

FROM         dbo.WF_TASK_ASSIGNMENT AS WF_TASK_ASSIGNMENT INNER JOIN
                      dbo.PERSON AS PERSON ON PERSON.person_id = WF_TASK_ASSIGNMENT.person_id LEFT OUTER JOIN
                      dbo.PERSON_ORGANIZATION_AFFILIATION AS PERSON_ORGANIZATION_AFFILIATION ON 
                      PERSON.person_id = PERSON_ORGANIZATION_AFFILIATION.person_id AND PERSON_ORGANIZATION_AFFILIATION.is_primary = 1 LEFT OUTER JOIN
                      dbo.ORGANIZATION AS ORGANIZATION ON PERSON_ORGANIZATION_AFFILIATION.organization_id = ORGANIZATION.organization_id INNER JOIN
                      dbo.GRANTEE_PROJECT AS GRANTEE_PROJECT ON 
                      GRANTEE_PROJECT.grantee_project_id = WF_TASK_ASSIGNMENT.grantee_project_id INNER JOIN
                      dbo.PERSON AS APP_PERSON ON APP_PERSON.person_id = GRANTEE_PROJECT.primary_person_id LEFT OUTER JOIN
                      dbo.PERSON_ORGANIZATION_AFFILIATION AS APP_PERSON_ORGANIZATION_AFFILIATION ON 
                      APP_PERSON.person_id = APP_PERSON_ORGANIZATION_AFFILIATION.person_id AND 
                      APP_PERSON_ORGANIZATION_AFFILIATION.is_primary = 1 LEFT OUTER JOIN
                      dbo.ORGANIZATION AS APP_ORGANIZATION ON 
                      APP_PERSON_ORGANIZATION_AFFILIATION.organization_id = APP_ORGANIZATION.organization_id LEFT OUTER JOIN
                      dbo.a_REVIEW_COMMITTEE AS a_REVIEW_COMMITTEE ON a_REVIEW_COMMITTEE.id = WF_TASK_ASSIGNMENT.review_committee_id INNER JOIN
                      dbo.a_WF_PROJECT AS a_WF_PROJECT ON GRANTEE_PROJECT.wf_project_id = a_WF_PROJECT.id INNER JOIN
                      dbo.a_COMPETITION AS a_COMPETITION ON a_COMPETITION.id = a_WF_PROJECT.competition_id INNER JOIN
                      dbo.a_PROGRAM AS a_PROGRAM ON a_PROGRAM.id = a_COMPETITION.program_id INNER JOIN
                      dbo.a_WF_PROJECT_TASK AS a_WF_PROJECT_TASK ON GRANTEE_PROJECT.wf_project_id = a_WF_PROJECT_TASK.wf_project_id AND 
                      WF_TASK_ASSIGNMENT.wf_task_id = a_WF_PROJECT_TASK.wf_task_id LEFT OUTER JOIN
                      dbo.REVIEW_CYCLE_STAGE AS REVIEW_CYCLE_STAGE ON 
                      REVIEW_CYCLE_STAGE.review_cycle_stage_id = WF_TASK_ASSIGNMENT.review_cycle_stage_id LEFT OUTER JOIN
                      dbo.a_REVIEW_CYCLE AS a_REVIEW_CYCLE ON a_REVIEW_CYCLE.id = REVIEW_CYCLE_STAGE.review_cycle_id INNER JOIN
                      dbo.a_WF_TASK AS a_WF_TASK ON WF_TASK_ASSIGNMENT.wf_task_id = a_WF_TASK.id INNER JOIN
                      dbo.vPERSON_NAMES ON PERSON.person_id = dbo.vPERSON_NAMES.person_id INNER JOIN
                      dbo.vPERSON_NAMES AS vPERSON_NAMES_APP ON APP_PERSON.person_id = vPERSON_NAMES_APP.person_id INNER JOIN
                      dbo.vPERSON_NAMES AS vPERSON_NAMES_1 ON PERSON.person_id = vPERSON_NAMES_1.person_id INNER JOIN
                      dbo.a_WF_TASK_STATUS AS a_WF_TASK_STATUS ON a_WF_TASK_STATUS.id = WF_TASK_ASSIGNMENT.wf_task_status_id LEFT OUTER JOIN
                      dbo.vREVIEW_CYCLE_STAGE_TASK_ASSIGNMENTS_COUNT ON 
                      REVIEW_CYCLE_STAGE.review_cycle_stage_id = dbo.vREVIEW_CYCLE_STAGE_TASK_ASSIGNMENTS_COUNT.review_cycle_stage_id
WHERE     (WF_TASK_ASSIGNMENT.wf_task_role_id = 9) OR
                      (WF_TASK_ASSIGNMENT.wf_task_role_id = 7)
