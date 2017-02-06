ALTER TABLE lsc_review_application
  ADD cases_dec_prev_yr_20_desc varchar(max),
           pai_cases_dec_prev_yr_20_desc varchar(max),
           census_adj_issues bit null,
           high_pct_ext_pai_case bit null,
           resource_intensive_pai bit null,
           low_case_rate_other_pai bit null,
           low_case_rate_comment_pai bit null