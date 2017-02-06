/****** Object:  StoredProcedure [dbo].[spLSC_POSTSUBMISSION_TIG_REVIEW_O_R_WI_PRESIDENT]    Script Date: 09/01/2010 13:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLSC_POSTSUBMISSION_TIG_REVIEW_O_R_WI_PRESIDENT]
	@WfTaskAssignmentID INT
AS

Declare @status_id int, @success bit, @status_message varchar(250)

DECLARE @wf_task_outcome_id INT,
	@grantee_project_id INT,
	@opp_dir_wfta_id INT
	

SELECT @wf_task_outcome_id = wf_task_outcome_id,
	@grantee_project_id = grantee_project_id
	FROM WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @WfTaskAssignmentID

--Populate grant file with recommended amount from president's review
UPDATE LSC_GRANTEE_PROJECT_TIG
	SET recommended_amount = tr.recommended_funding_amount
	FROM LSC_TIG_REVIEW_OPEN_REP_WEB_IMPR tr
		JOIN WF_TASK_ASSIGNMENT wfta ON tr.wf_task_assignment_id = wfta.wf_task_assignment_id
		JOIN LSC_GRANTEE_PROJECT_TIG gpt ON wfta.grantee_project_id = gpt.grantee_project_id
	WHERE wfta.wf_task_assignment_id = @WfTaskAssignmentID

--Get task assignment ID for OPP Director review
SELECT @opp_dir_wfta_id = wf_task_assignment_id
	FROM WF_TASK_ASSIGNMENT
	WHERE grantee_project_id = @grantee_project_id
		AND wf_task_id in (45,48)

--Populate grant file with review comment from OPP Director review
UPDATE LSC_GRANTEE_PROJECT_TIG
	SET review_comments = tr.overall_comment
	FROM LSC_TIG_REVIEW_OPEN_REP_WEB_IMPR tr
		JOIN WF_TASK_ASSIGNMENT wfta ON tr.wf_task_assignment_id = wfta.wf_task_assignment_id
		JOIN LSC_GRANTEE_PROJECT_TIG gpt ON wfta.grantee_project_id = gpt.grantee_project_id
	WHERE wfta.wf_task_assignment_id = @opp_dir_wfta_id


IF @wf_task_outcome_id = 110 --Do not fund
BEGIN
	--Set grant status to "Not Awarded"
	UPDATE GRANTEE_PROJECT
		SET grant_status_id = 8
		WHERE grantee_project_id = @grantee_project_id
END --IF @wf_task_outcome_id = 110 (Do not fund)

IF @wf_task_outcome_id = 109 --Fund
BEGIN
	--Set grant status to "Pending"
	UPDATE GRANTEE_PROJECT
		SET grant_status_id = 6
		WHERE grantee_project_id = @grantee_project_id

	--Get application task assignment ID
	DECLARE @app_wfta_id INT

	SELECT @app_wfta_id = wf_task_assignment_id
		FROM WF_TASK_ASSIGNMENT
		WHERE grantee_project_id = @grantee_project_id
			AND wf_task_id = 41

	--Get Brief Description of Proposed Project from app and populate into grant file
	DECLARE @brief_descr varchar(max)

	SELECT @brief_descr = brief_description
		FROM LSC_TIG_APP
		WHERE wf_task_assignment_id = @app_wfta_id

	UPDATE GRANTEE_PROJECT
		SET grant_description = @brief_descr
		WHERE grantee_project_id = @grantee_project_id

	UPDATE LSC_GRANTEE_PROJECT_TIG
		SET comments_updated = @brief_descr
		WHERE grantee_project_id = @grantee_project_id

	--Get Partners from application and populate into grant file
	UPDATE LSC_GRANTEE_PROJECT_TIG
		SET partners = ta.stmt_additional_funds
		FROM LSC_TIG_APP ta 
			JOIN WF_TASK_ASSIGNMENT wfta ON wfta.wf_task_assignment_id = ta.wf_task_assignment_id
			JOIN LSC_GRANTEE_PROJECT_TIG gpt ON wfta.grantee_project_id = gpt.grantee_project_id
		WHERE wfta.wf_task_assignment_id = @app_wfta_id

	--Check to see if recommended amount differs from request
	DECLARE @requested_amount INT,
		@recommended_amount INT

	SELECT @requested_amount = grant_request 
		FROM LSC_TIG_APP
		WHERE wf_task_assignment_id = @app_wfta_id

	SELECT @recommended_amount = recommended_amount 
		FROM LSC_GRANTEE_PROJECT_TIG
		WHERE grantee_project_id = @grantee_project_id

	IF @requested_amount <> @recommended_amount
	BEGIN 
		--Create task assignment to update budget
		DECLARE @new_id INT,
			@easygrants_user_id INT

		EXEC @new_id = getid_sel @table='WF_TASK_ASSIGNMENT',
			@mode = 2

		SELECT @easygrants_user_id = eu.easygrants_user_id
			FROM WF_TASK_ASSIGNMENT wfta
				JOIN EASYGRANTS_USER eu ON wfta.person_id = eu.person_id
			WHERE wfta.wf_task_assignment_id = @WfTaskAssignmentID

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
			VALUES(@new_id,
				58,
				1,
				126,
				@grantee_project_id,
				4, --TIG review workgroup
				7,
				getdate(),
				@easygrants_user_id)

		--Move budget data from grant to new task assignment
		EXEC spLSC_XFER_TIG_BUDGET_TO_WFTA @WfTaskAssignmentID = @new_id

		--Create task assignment to update payment/reporting schedule
		EXEC @new_id = getid_sel @table='WF_TASK_ASSIGNMENT',
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
			VALUES(@new_id,
				59,
				1,
				124,
				@grantee_project_id,
				4, --TIG review workgroup
				7,
				getdate(),
				@easygrants_user_id)

		--Move payment/reporting data from grant to new task assignment
		exec spLSC_XFER_TIG_PAYMENT_SCHEDULE_TO_WFTA
			@WfTaskAssignmentID = @new_id

	END --@requested_amount <> @recommended_amount
	ELSE --@requested_amount = @recommended_amount
	BEGIN
		--Copy payment and reporting schedule to grant
		EXEC spLSC_TIG_COPY_PAYMENT_SCHEDULE_TO_GRANT @wfta_id = @WfTaskAssignmentID
	END --@requested_amount = @recommended_amount

END --IF @wf_task_outcome_id = 109 (Fund)


set @status_id = 1
set @success = 1
set @status_message = 'SUCCESS'

select @status_id As StatusID, @success as Success, @status_message As StatusMessage

