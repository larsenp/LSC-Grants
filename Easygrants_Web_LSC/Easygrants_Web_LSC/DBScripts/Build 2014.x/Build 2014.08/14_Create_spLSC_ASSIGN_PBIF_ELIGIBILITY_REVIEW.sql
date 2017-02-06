CREATE PROCEDURE [dbo].[spLSC_ASSIGN_PBIF_ELIGIBILITY_REVIEW]
	@grantee_project_id INT  
AS

DECLARE 
    @eligibility_wfta_id INT

   SELECT @eligibility_wfta_id = wf_task_assignment_id
	FROM WF_TASK_ASSIGNMENT
	WHERE grantee_project_id = @grantee_project_id and wf_task_id = 103

--Create task assignment for eligibility review only if it does not exist
 IF @eligibility_wfta_id IS NULL
	BEGIN

	EXEC @eligibility_wfta_id = getid_sel @table='WF_TASK_ASSIGNMENT',
		@mode = 2

	INSERT WF_TASK_ASSIGNMENT
		(wf_task_assignment_id,
		wf_task_id,
		wf_task_status_id,
		wf_task_outcome_id,
		grantee_project_id,
		workgroup_id,
		wf_task_role_id,
		create_date)
		VALUES (@eligibility_wfta_id,
			103,
			1,
			238,
			@grantee_project_id,
			10,
			7,
			getdate())

   END
 ELSE
   BEGIN

     UPDATE WF_TASK_ASSIGNMENT
		SET wf_task_status_id = 1
		WHERE wf_task_assignment_id = @eligibility_wfta_id

   END
