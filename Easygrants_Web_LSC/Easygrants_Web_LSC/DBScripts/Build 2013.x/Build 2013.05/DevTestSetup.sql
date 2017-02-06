--Run this script after all the numbered scripts when setting up a clean dataset in the dev or test environment.
--Make project tasks and task assignments available immediately
UPDATE a_WF_PROJECT_TASK
	SET start_date = '2013-3-1',
		open_date = '2013-3-1'
	FROM a_WF_PROJECT_TASK wfpt
		JOIN a_WF_PROJECT wfp ON wfpt.wf_project_id = wfp.id
	WHERE wfp.time_period_id = 19

UPDATE WF_TASK_ASSIGNMENT
	SET open_date = '2013-3-1', start_date = '2013-3-1'
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
	WHERE wfta.wf_task_id IN (4,67)
		AND wcy.wfta_year = 2014

--Include Peter and Bindu in the NIC Approval workgroup.
DECLARE @new_id int
EXEC @new_id = getid_sel @table='WORK_GROUP_MEMBER'

INSERT WORK_GROUP_MEMBER
	(work_group_member_id, work_group_id, person_id)
	VALUES(@new_id, 2, 4)

EXEC @new_id = getid_sel @table='WORK_GROUP_MEMBER'

INSERT WORK_GROUP_MEMBER
	(work_group_member_id, work_group_id, person_id)
	VALUES(@new_id, 2, 381)

--Change due date for NIC internal review to allow submission for post-PQV applicants	
UPDATE a_WF_PROJECT_TASK
	SET due_date = '2013-3-13'
	FROM a_WF_PROJECT_TASK wfpt
		JOIN a_WF_PROJECT wfp ON wfpt.wf_project_id = wfp.id
	WHERE wfpt.wf_task_id = 3
		and wfp.time_period_id = 19


--Add grant request and application task assignment 
--Sandy disaster grant - Pine Tree (120000)
declare @new_gp_id int
    ,@new_wfta_id int

exec @new_gp_id = getid_sel @table = 'grantee_project'

INSERT INTO [GRANTEE_PROJECT]
           ([grantee_project_id]
           ,[grantee_id]
           ,[wf_project_id]
           ,[primary_person_id]
           ,[primary_organization_id]
           ,[grant_status_id]
)
     VALUES
           (@new_gp_id
           ,1607
           ,3047
           ,7
           ,652
           ,2)

exec @new_wfta_id = getid_sel @table = 'wf_task_assignment'

INSERT INTO [WF_TASK_ASSIGNMENT]
           ([wf_task_assignment_id]
           ,[wf_task_id]
           ,[wf_task_status_id]
           ,[wf_task_outcome_id]
           ,[grantee_project_id]
           ,[person_id]
           ,[wf_task_role_id])
     VALUES
           (@new_wfta_id
           ,90
           ,1
           ,206
           ,@new_gp_id
           ,7
           ,1)
