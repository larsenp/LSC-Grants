/****** Object:  StoredProcedure [dbo].[spCOPY_RENEWAL_REVIEW_WfTA]    Script Date: 06/10/2008 10:43:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCOPY_RENEWAL_REVIEW_WfTA]
	(@source_wf_task_assignment_id int,
	@target_wf_task_assignment_id int)

AS

BEGIN TRAN

	DECLARE @next_id INT, @row_count INT

	--Copy LSC_RENEWAL_EVAL
	SELECT @row_count = COUNT(*)
		FROM LSC_RENEWAL_EVAL
		WHERE wf_task_assignment_id = @target_wf_task_assignment_id

	--If target LSC_RENEWAL_EVAL row does not exist, create it.
	IF @row_count = 0
	BEGIN
		EXEC @next_id = getid_sel @table = 'LSC_RENEWAL_EVAL', @mode = 2
		INSERT LSC_RENEWAL_EVAL
			(lsc_renewal_eval_id,
			wf_task_assignment_id)
			VALUES
				(@next_id,
				@target_wf_task_assignment_id)

	END

	UPDATE t
		SET comment_a = s.comment_a,
			form_d = s.form_d,
			comment_d = s.comment_d,
			form_g = s.form_g,
			comment_g = s.comment_g,
			form_i = s.form_i,
			comment_i = s.comment_i,
			form_k = s.form_k,
			comment_k = s.comment_k,
			form_l = s.form_l,
			comment_l = s.comment_l,
			management = s.management,
			intake = s.intake,
			techno = s.techno,
			pro_se = s.pro_se,
			pai = s.pai,
			coordination = s.coordination,
			resource_development = s.resource_development,
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
			compliance_memo = s.compliance_memo,
			compliance_memo_comment = s.compliance_memo_comment,
			program_profile = s.program_profile,
			program_profile_comment = s.program_profile_comment,
			other_docs = s.other_docs,
			other_docs_comment = s.other_docs_comment,
			cert_primary_reader_person_id = s.cert_primary_reader_person_id,
			cert_primary_reader_date = s.cert_primary_reader_date,
			cert_secondary_reader_person_id = s.cert_secondary_reader_person_id,
			cert_secondary_reader_date = s.cert_secondary_reader_date
		FROM LSC_RENEWAL_EVAL s,
			LSC_RENEWAL_EVAL t
		WHERE s.wf_task_assignment_id = @source_wf_task_assignment_id
			AND t.wf_task_assignment_id = @target_wf_task_assignment_id

	--Copy LSC_RENEWAL_REC
	SELECT @row_count = COUNT(*)
		FROM LSC_RENEWAL_REC
		WHERE wf_task_assignment_id = @target_wf_task_assignment_id

	--If target LSC_RENEWAL_REC row does not exist, create it.
	IF @row_count = 0
	BEGIN
		EXEC @next_id = getid_sel @table = 'LSC_RENEWAL_REC', @mode = 2
		INSERT LSC_RENEWAL_REC
			(lsc_renewal_rec_id,
			wf_task_assignment_id)
			VALUES
				(@next_id,
				@target_wf_task_assignment_id)

	END

	UPDATE t
		SET lsc_renewal_recommendation_id = s.lsc_renewal_recommendation_id,
			further_review_comment = s.further_review_comment,
			rationale_non_renewal = s.rationale_non_renewal,
			no_grant_conditions = s.no_grant_conditions,
			special_grant_conditions = s.special_grant_conditions,
			other_issues = s.other_issues,
			no_other_issues = s.no_other_issues,
			primary_reader_person_id = s.primary_reader_person_id,
			primary_reader_date = s.primary_reader_date,
			rec_reader_person_id = s.rec_reader_person_id,
			rec_reader_date = s.rec_reader_date,
			opp_mgmt_person_id = s.opp_mgmt_person_id,
			opp_mgmt_date = s.opp_mgmt_date
		FROM LSC_RENEWAL_REC s,
			LSC_RENEWAL_REC t
		WHERE s.wf_task_assignment_id = @source_wf_task_assignment_id
			AND t.wf_task_assignment_id = @target_wf_task_assignment_id

	--Copy LSC_GRANT_CONDITION (get IDs of reviewed task assignments and pass to the stored procedure)
	DECLARE @source_renew_wfta_id INT, @target_renew_wfta_id INT

	SELECT @source_renew_wfta_id = gplra.latest_renewal_wfta_id
		FROM WF_TASK_ASSIGNMENT wfta_rev
			JOIN vGRANTEE_PROJECT_LATEST_RENEWAL_APP gplra ON wfta_rev.grantee_project_id = gplra.grantee_project_id
		WHERE wfta_rev.wf_task_assignment_id = @source_wf_task_assignment_id

	SELECT @target_renew_wfta_id = gplra.latest_renewal_wfta_id
		FROM WF_TASK_ASSIGNMENT wfta_rev
			JOIN vGRANTEE_PROJECT_LATEST_RENEWAL_APP gplra ON wfta_rev.grantee_project_id = gplra.grantee_project_id
		WHERE wfta_rev.wf_task_assignment_id = @target_wf_task_assignment_id

	EXEC spCOPY_LSC_GRANT_CONDITION
		@source_reviewed_wfta_id = @source_renew_wfta_id,
		@target_reviewed_wfta_id = @target_renew_wfta_id

COMMIT TRAN