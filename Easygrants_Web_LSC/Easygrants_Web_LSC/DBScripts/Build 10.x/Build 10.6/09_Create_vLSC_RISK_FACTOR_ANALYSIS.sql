/****** Object:  View [dbo].[vLSC_RISK_FACTOR_ANALYSIS]    Script Date: 06/10/2011 11:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_RISK_FACTOR_ANALYSIS]
AS
SELECT lsc_risk_factor_analysis_id
	,wf_task_assignment_id
	,CASE WHEN last_opp_visit = 1 AND ISNULL(last_opp_visit_comment,'') = '' THEN 0 ELSE 1 END last_opp_visit_valid
	,CASE WHEN sig_prog_issues = 1 AND ISNULL(sig_prog_issues_comment,'') = '' THEN 0 ELSE 1 END sig_prog_issues_valid
	,CASE WHEN other_sig_issues = 1 AND ISNULL(other_sig_issues_comment,'') = '' THEN 0 ELSE 1 END other_sig_issues_valid
	,CASE WHEN issues_lsc_contacts = 1 AND ISNULL(issues_lsc_contacts_comment,'') = '' THEN 0 ELSE 1 END issues_lsc_contacts_valid
	,CASE WHEN issues_oce_opp = 1 AND ISNULL(issues_oce_opp_comment,'') = '' THEN 0 ELSE 1 END issues_oce_opp_valid
	,CASE WHEN sig_complaints = 1 AND ISNULL(sig_complaints_comment,'') = '' THEN 0 ELSE 1 END sig_complaints_valid
	,CASE WHEN oce_opp_areas_interest = 1 AND ISNULL(oce_opp_areas_interest_comment,'') = '' THEN 0 ELSE 1 END oce_opp_areas_interest_valid
	,CASE WHEN program_size_issues = 1 AND ISNULL(program_size_issues_comment,'') = '' THEN 0 ELSE 1 END program_size_issues_valid
	,CASE WHEN req_rptg_issues = 1 AND ISNULL(req_rptg_issues_comment,'') = '' THEN 0 ELSE 1 END req_rptg_issues_valid
	,CASE WHEN issues_other_funders = 1 AND ISNULL(issues_other_funders_comment,'') = '' THEN 0 ELSE 1 END issues_other_funders_valid
	,CASE WHEN leadership_transition = 1 AND ISNULL(leadership_transition_comment,'') = '' THEN 0 ELSE 1 END leadership_transition_valid
	,CASE WHEN financial_reviews = 1 AND ISNULL(financial_reviews_comment,'') = '' THEN 0 ELSE 1 END financial_reviews_valid
	,CASE WHEN oig_issues = 1 AND ISNULL(oig_issues_comment,'') = '' THEN 0 ELSE 1 END oig_issues_valid
	,CASE WHEN other = 1 AND ISNULL(other_comment,'') = '' THEN 0 ELSE 1 END other_valid
	FROM LSC_RISK_FACTOR_ANALYSIS