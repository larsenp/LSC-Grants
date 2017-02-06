CREATE PROCEDURE spLSC_COPY_OCE_STAFF_COMP_APP_REVIEW_WfTA
	(@source_wf_task_assignment_id int,
	@target_wf_task_assignment_id int)

AS

EXEC spLSC_COPY_LSC_REVIEW_ASSIGNMENT_INQUIRY
	@source_wf_task_assignment_id = @source_wf_task_assignment_id,
	@target_wf_task_assignment_id = @target_wf_task_assignment_id

IF @@TRANCOUNT > 1
	RETURN

BEGIN TRAN
	DECLARE @row_count int, @next_id int

	--Copy LSC_REVIEW_APPLICATION (Funding term, eval part 2 & 3, etc.)
	SELECT @row_count = COUNT(*)
		FROM LSC_REVIEW_APPLICATION
		WHERE wf_task_assignment_id = @target_wf_task_assignment_id

	IF @row_count = 0
	BEGIN
		EXEC @next_id = getid_sel @table = 'LSC_REVIEW_APPLICATION', @mode = 2
		INSERT LSC_REVIEW_APPLICATION
			(lsc_review_application_id,
			wf_task_assignment_id)
			VALUES
				(@next_id,
				@target_wf_task_assignment_id)
	END

	UPDATE t
		SET lsc_funding_term_id = s.lsc_funding_term_id,
			grant_proposal_summary = s.grant_proposal_summary,
			violation_pl = s.violation_pl,
			comment2 = s.comment2,
			violation_other = s.violation_other,
			comment3 = s.comment3,
			claims = s.claims,
			comment4 = s.comment4,
			conflicts1 = s.conflicts1,
			comment5 = s.comment5,
			conflicts2 = s.conflicts2,
			comment6 = s.comment6,
			sg1 = s.sg1,
			sg2 = s.sg2,
			certification = s.certification,
			comment7 = s.comment7,
			forms = s.forms,
			comment8 = s.comment8,
			other = s.other,
			comment9 = s.comment9,
			app_overview_format = s.app_overview_format,
			app_overview_comprehensive = s.app_overview_comprehensive,
			app_overview_comment = s.app_overview_comment,
			staffing_data = s.staffing_data,
			csr_data = s.csr_data,
			non_lsc_funding_data = s.non_lsc_funding_data,
			grantee_profile_comment = s.grantee_profile_comment,
			corrective_action_requirements = s.corrective_action_requirements,
			applicant_complaints = s.applicant_complaints,
			oce_report_comment = s.oce_report_comment,
			pai_plan_submitted = s.pai_plan_submitted,
			pai_plan_responsive = s.pai_plan_responsive,
			pai_plan_comment = s.pai_plan_comment,
			evaluation_comments  = s.evaluation_comments,
			Special_Grant = s.Special_Grant,
			SpecialGrant_Comment = s.SpecialGrant_Comment
		FROM LSC_REVIEW_APPLICATION s,
			LSC_REVIEW_APPLICATION t
		WHERE s.wf_task_assignment_id = @source_wf_task_assignment_id
			AND t.wf_task_assignment_id = @target_wf_task_assignment_id

	--Copy LSC_OA1
	SELECT @row_count = COUNT(*)
		FROM LSC_OA1
		WHERE wf_task_assignment_id = @target_wf_task_assignment_id

	IF @row_count = 0
	BEGIN
		EXEC @next_id = getid_sel @table = 'LSC_OA1', @mode = 2
		INSERT LSC_OA1
			(lsc_oa1_id,
			wf_task_assignment_id)
			VALUES
				(@next_id,
				@target_wf_task_assignment_id)
	END

	UPDATE t
		SET chk_I_A = s.chk_I_A,
			chk_I_B = s.chk_I_B,
			chk_II_C_1 = s.chk_II_C_1,
			chk_II_C_2 = s.chk_II_C_2,
			chk_II_C_3 = s.chk_II_C_3,
			chk_II_C_4 = s.chk_II_C_4,
			chk_II_C_5 = s.chk_II_C_5,
			chk_II_C_6 = s.chk_II_C_6,
			chk_II_C_7 = s.chk_II_C_7,
			chk_II_C_8 = s.chk_II_C_8,
			chk_II_C_9 = s.chk_II_C_9,
			chk_II_C_10 = s.chk_II_C_10,
			comment_II_C = s.comment_II_C,
			chk_II_C_11 = s.chk_II_C_11,
			comment_II_C_11 = s.comment_II_C_11,
			comment_III = s.comment_III,
			staff_reader_person_id = s.staff_reader_person_id,
			staff_reader_date = s.staff_reader_date,
			opp_mgmt_person_id = s.opp_mgmt_person_id,
			opp_mgmt_date = s.opp_mgmt_date
		FROM LSC_OA1 s,
			LSC_OA1 t
		WHERE s.wf_task_assignment_id = @source_wf_task_assignment_id
			AND t.wf_task_assignment_id = @target_wf_task_assignment_id

COMMIT TRAN