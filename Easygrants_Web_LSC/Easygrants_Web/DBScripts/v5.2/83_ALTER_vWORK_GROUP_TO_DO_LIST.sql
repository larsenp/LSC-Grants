
/*This view has been updated because update to vWF_TASK_ASSIGNMENT_WORK_GROUP_MEMBER caused , task to be displayed to all members of all workgroup. this was an affect from updating vWF_TASK_ASSIGNMENT_WORK_GROUP_MEMBER view. */

ALTER VIEW [dbo].[vWORK_GROUP_TO_DO_LIST]
AS
SELECT     CONVERT(VARCHAR(10), wtawgm.person_id) + '_' + CONVERT(VARCHAR(10), wtawgm.wf_task_assignment_id) AS work_group_task_list_key, 
                      wtawgm.wf_task_assignment_id, wtawgm.person_id, wfta.open_date, wfta.create_date as create_date, wfpt.description AS task_title, gp.grantee_project_id,gp.legacy_grant_id, gp.short_title, 
                      pp.name_last + ', ' + pp.name_first AS Primary_Person, o.organization_name, o.organization_id, wfta.person_id As task_person_id
FROM         dbo.vWF_TASK_ASSIGNMENT_WORK_GROUP_MEMBER AS wtawgm INNER JOIN
                      dbo.PERSON AS p ON p.person_id = wtawgm.person_id INNER JOIN
                      dbo.WF_TASK_ASSIGNMENT AS wfta ON wtawgm.wf_task_assignment_id = wfta.wf_task_assignment_id and wfta.workgroup_id = wtawgm.workgroup_id INNER JOIN
					  dbo.GRANTEE_PROJECT AS gp ON wfta.grantee_project_id = gp.grantee_project_id INNER JOIN
					  dbo.PERSON AS pp on gp.primary_person_id = pp.person_id INNER JOIN						
                      dbo.a_WF_PROJECT_TASK AS wfpt ON wfta.wf_task_id = wfpt.wf_task_id AND gp.wf_project_id = wfpt.wf_project_id LEFT JOIN
                      dbo.ORGANIZATION AS o ON o.organization_id = gp.primary_organization_id


