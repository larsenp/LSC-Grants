/****** Object:  StoredProcedure [dbo].[spCOPY_APPLICATION_REVIEW_WfTA]    Script Date: 06/16/2008 10:58:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCOPY_APPLICATION_REVIEW_WfTA]
	(@source_wf_task_assignment_id int,
	@target_wf_task_assignment_id int)

AS

BEGIN TRAN
	--Copy inquiry responses
	DECLARE @next_id INT, @row_count INT

	CREATE TABLE #ids
		(source_id int,
		ident int identity(0,1))

	INSERT #ids (source_id)
		SELECT lsc_review_assignment_inquiry_id
			FROM LSC_REVIEW_ASSIGNMENT_INQUIRY
			WHERE wf_task_assignment_id = @source_wf_task_assignment_id

	SELECT @row_count = COUNT(*) 
		FROM #ids

	EXEC @next_id = spGETID_RANGE_SEL @table = 'LSC_REVIEW_ASSIGNMENT_INQUIRY', @count = @row_count, @mode = 2

	DELETE LSC_REVIEW_ASSIGNMENT_INQUIRY
		WHERE wf_task_assignment_id = @target_wf_task_assignment_id

	INSERT LSC_REVIEW_ASSIGNMENT_INQUIRY
		(lsc_review_assignment_inquiry_id,
		wf_task_assignment_id,
		lsc_review_inquiry_id,
		lsc_review_inquiry_score_id,
		comment)
		SELECT #ids.ident + @next_id,
			@target_wf_task_assignment_id,
			lsc_review_inquiry_id,
			lsc_review_inquiry_score_id,
			comment
			FROM LSC_REVIEW_ASSIGNMENT_INQUIRY lrai
				JOIN #ids ON lrai.lsc_review_assignment_inquiry_id = #ids.source_id

	TRUNCATE TABLE #ids

	INSERT #ids (source_id)
		SELECT lsc_review_assignment_element_id
			FROM LSC_REVIEW_ASSIGNMENT_ELEMENT
			WHERE wf_task_assignment_id = @source_wf_task_assignment_id

	SELECT @row_count = COUNT(*) 
		FROM #ids

	EXEC @next_id = spGETID_RANGE_SEL @table = 'LSC_REVIEW_ASSIGNMENT_ELEMENT', @count = @row_count, @mode = 2

	--Copy strong/weak element indicators
	DELETE LSC_REVIEW_ASSIGNMENT_ELEMENT
		WHERE wf_task_assignment_id = @target_wf_task_assignment_id

	INSERT LSC_REVIEW_ASSIGNMENT_ELEMENT
		(lsc_review_assignment_element_id,
		lsc_review_element_id,
		wf_task_assignment_id,
		checked)
		SELECT #ids.ident + @next_id,
			lsc_review_element_id,
			@target_wf_task_assignment_id,
			checked
			FROM LSC_REVIEW_ASSIGNMENT_ELEMENT lrae
				JOIN #ids ON lrae.lsc_review_assignment_element_id = #ids.source_id

	TRUNCATE TABLE #ids

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
			oce_report_comment = s.oce_report_comment
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

	--Copy LSC_OA2
	SELECT @row_count = COUNT(*)
		FROM LSC_OA2
		WHERE wf_task_assignment_id = @target_wf_task_assignment_id

	IF @row_count = 0
	BEGIN
		EXEC @next_id = getid_sel @table = 'LSC_OA2', @mode = 2
		INSERT LSC_OA2
			(lsc_OA2_id,
			wf_task_assignment_id)
			VALUES
				(@next_id,
				@target_wf_task_assignment_id)
	END

	UPDATE t
		SET fund_total = s.fund_total,
			fund_total_cond = s.fund_total_cond,
			fund_all = s.fund_all,
			fund_restrict = s.fund_restrict,
			no_fund = s.no_fund,
			part_2_comment = s.part_2_comment,
			no_further_review = s.no_further_review,
			part_3_comment = s.part_3_comment,
			staff_reader_person_id = s.staff_reader_person_id,
			staff_reader_date = s.staff_reader_date,
			opp_mgmt_person_id = s.opp_mgmt_person_id,
			opp_mgmt_date = s.opp_mgmt_date,
			no_grant_conditions = s.no_grant_conditions,
			part_4_comment = s.part_4_comment,
			no_other_issues = s.no_other_issues,
			part_5_comment = s.part_5_comment,
			special_grant_conditions = s.special_grant_conditions,
			special_grant_condition_language = s.special_grant_condition_language,
			lsc_funding_term_id = s.lsc_funding_term_id
		FROM LSC_OA2 s,
			LSC_OA2 t
		WHERE s.wf_task_assignment_id = @source_wf_task_assignment_id
			AND t.wf_task_assignment_id = @target_wf_task_assignment_id

	--Copy LSC_GRANT_CONDITION (get IDs of reviewed task assignments and pass to the stored procedure)
	DECLARE @source_app_wfta_id INT, @target_app_wfta_id INT

	SELECT @source_app_wfta_id = wfta_app.wf_task_assignment_id
		FROM WF_TASK_ASSIGNMENT wfta_app
			JOIN WF_TASK_ASSIGNMENT wfta_rev ON wfta_app.grantee_project_id = wfta_rev.grantee_project_id
		WHERE wfta_rev.wf_task_assignment_id = @source_wf_task_assignment_id
			AND wfta_app.wf_task_id = 2

	SELECT @target_app_wfta_id = wfta_app.wf_task_assignment_id
		FROM WF_TASK_ASSIGNMENT wfta_app
			JOIN WF_TASK_ASSIGNMENT wfta_rev ON wfta_app.grantee_project_id = wfta_rev.grantee_project_id
		WHERE wfta_rev.wf_task_assignment_id = @target_wf_task_assignment_id
			AND wfta_app.wf_task_id = 2

	EXEC spCOPY_LSC_GRANT_CONDITION
		@source_reviewed_wfta_id = @source_app_wfta_id,
		@target_reviewed_wfta_id = @target_app_wfta_id

COMMIT TRAN
