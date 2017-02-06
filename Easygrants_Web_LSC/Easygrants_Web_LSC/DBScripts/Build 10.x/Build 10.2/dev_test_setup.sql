/*********************************************

THE FOLLOWING SCRIPT IS FOR USE IN THE DEVELOPMENT AND TEST ENVIRONMENTS ONLY!

*********************************************/

--Update system dates so that service areas and task assignments are available for testing immediately.
UPDATE WF_TASK_ASSIGNMENT
	SET open_date = getdate(), 
		start_date = getdate()
	WHERE wf_task_id = 67

UPDATE WF_TASK_ASSIGNMENT
	SET open_date = getdate(), 
		start_date = getdate()
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
	WHERE wfta.wf_task_id = 4
		AND wcy.wfta_year = 2012

UPDATE a_WF_PROJECT_TASK 
	SET open_date = getdate(), 
		start_date = getdate()	
	FROM a_WF_PROJECT_TASK wfpt
		JOIN a_WF_PROJECT wfp ON wfpt.wf_project_id = wfp.id
	WHERE wf_task_id in (1,2,66)
		AND wfp.time_period_id = 17
		
--Add testers to workgroup for approving NICs
declare @new_id int

EXEC @new_id = getid_sel
	@table = 'WORK_GROUP_MEMBER',
	@mode = 2

INSERT WORK_GROUP_MEMBER
	(work_group_member_id,
	work_group_id,
	person_id)
	VALUES(@new_id, 2, 4) -- Peter
	
EXEC @new_id = getid_sel
	@table = 'WORK_GROUP_MEMBER',
	@mode = 2

INSERT WORK_GROUP_MEMBER
	(work_group_member_id,
	work_group_id,
	person_id)
	VALUES(@new_id, 2, 151) -- Alex

EXEC @new_id = getid_sel
	@table = 'WORK_GROUP_MEMBER',
	@mode = 2

INSERT WORK_GROUP_MEMBER
	(work_group_member_id,
	work_group_id,
	person_id)
	VALUES(@new_id, 2, 381) -- Bindu

EXEC @new_id = getid_sel
	@table = 'WORK_GROUP_MEMBER',
	@mode = 2

INSERT WORK_GROUP_MEMBER
	(work_group_member_id,
	work_group_id,
	person_id)
	VALUES(@new_id, 2, 816) -- Christina

