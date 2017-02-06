

ALTER TABLE LSC_RISK_FACTOR_ANALYSIS
	ADD tig_performance_issues bit null,
		tig_performance_issues_comment varchar(max) null,
        issues_board_composition bit null,
        issues_board_composition_comment varchar(max) null, 
		issues_opp_grant_eval bit null,
        issues_opp_grant_eval_comment varchar(max) null,
		opp_areas_interest bit null,
		opp_areas_interest_comment varchar(max) null,
        issues_opp_req_rptg bit null, 
        issues_opp_req_rptg_comment varchar(max) null