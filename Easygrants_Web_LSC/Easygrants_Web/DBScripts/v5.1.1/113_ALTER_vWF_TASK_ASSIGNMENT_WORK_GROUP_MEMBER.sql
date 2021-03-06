
ALTER  VIEW [dbo].[vWF_TASK_ASSIGNMENT_WORK_GROUP_MEMBER]
AS

--SELECT WF_TASK_ASSIGNMENT.wf_task_assignment_id, WORK_GROUP_MEMBER.person_id, WORK_GROUP_MEMBER.work_group_id AS workgroup_id
--FROM  WORK_GROUP_MEMBER INNER JOIN
--               v_ASSIGN_TASK_TO_ROLEWORKGROUPSTAFFCONTACT ON 
--               WORK_GROUP_MEMBER.work_group_id = v_ASSIGN_TASK_TO_ROLEWORKGROUPSTAFFCONTACT.id INNER JOIN
--               WF_TASK_ASSIGNMENT ON v_ASSIGN_TASK_TO_ROLEWORKGROUPSTAFFCONTACT.id = WF_TASK_ASSIGNMENT.workgroup_id
--WHERE (v_ASSIGN_TASK_TO_ROLEWORKGROUPSTAFFCONTACT.type = 'WG')

--Updated the View to Have all workgroups associate with the wfTaskAssignment whose workgroupid is nothing 
SELECT 
WF_TASK_ASSIGNMENT.wf_task_assignment_id, WORK_GROUP_MEMBER.person_id, WORK_GROUP_MEMBER.work_group_id AS workgroup_id
FROM wf_task_assignment , WORK_GROUP_MEMBER