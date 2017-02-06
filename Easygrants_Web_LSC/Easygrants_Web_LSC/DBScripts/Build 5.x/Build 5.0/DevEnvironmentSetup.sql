/*
The purpose of this script is to allow testing in the test environment without affecting the dates
set up for the production environment. For test deployments, this script should be run after all the
numbered scripts in this folder. 

DO NOT RUN THIS SCRIPT IN PRODUCTION

*/

--Update start and open dates for NIC and application project tasks so that they will be available immediately.
--overwrites data from scripts #16 and #17
UPDATE a_WF_PROJECT_TASK
	SET start_date = getdate(),
		open_date = getdate()
	WHERE start_date = '2009-4-10'

--Update start and open dates for renewal task assignments for the current cycle.
--overwrites data from script #18
UPDATE WF_TASK_ASSIGNMENT
	SET start_date = getdate(),
		open_date = getdate()
	WHERE start_date = '2009-4-10'

--Change end date on obsolete software product items so that they will be excluded immediately in test environment.
--overwrites data from script #25
UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = GETDATE()
	WHERE id = 31 --TurboCases
		OR software_type_id = 9 --Network
		
--Add Alex and Peter to workgroup for approving NICs
declare @new_id int

EXEC @new_id = getid_sel
	@table = 'WORK_GROUP_MEMBER',
	@mode = 2

INSERT WORK_GROUP_MEMBER
	(work_group_member_id,
	work_group_id,
	person_id)
	VALUES(@new_id, 2, 4)
	
EXEC @new_id = getid_sel
	@table = 'WORK_GROUP_MEMBER',
	@mode = 2

INSERT WORK_GROUP_MEMBER
	(work_group_member_id,
	work_group_id,
	person_id)
	VALUES(@new_id, 2, 151)
