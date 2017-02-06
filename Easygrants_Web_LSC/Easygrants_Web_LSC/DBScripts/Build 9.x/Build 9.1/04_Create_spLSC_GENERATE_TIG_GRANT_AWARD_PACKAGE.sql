CREATE PROCEDURE spLSC_GENERATE_TIG_GRANT_AWARD_PACKAGE
	(@grantee_project_id int,
	@easygrants_user_id int)

AS

	--Create task assignment to review grant award package
	DECLARE @rgap_id int
	EXEC @rgap_id = getid_sel @table='WF_TASK_ASSIGNMENT',
		@mode = 2

	INSERT WF_TASK_ASSIGNMENT
		(wf_task_assignment_id,
		wf_task_id,
		wf_task_status_id,
		wf_task_outcome_id,
		grantee_project_id,
		workgroup_id,
		wf_task_role_id,
		create_date,
		create_user_id)
		VALUES(@rgap_id,
			62,
			1,
			131,
			@grantee_project_id,
			5, --Grant Award Package Reviewer workgroup
			16,
			getdate(),
			@easygrants_user_id)

	--Generate grant award package
	DECLARE @ro_id int
	EXEC @ro_id = getid_sel @table='REPORT_OUTPUT',
		@mode = 2

	INSERT REPORT_OUTPUT
		(report_output_id,
		entity_id,
		definition_id,
		gen_request_date)
		VALUES (@ro_id,
			@rgap_id,
			13,
			getdate())
	
