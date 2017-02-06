ALTER TABLE LSC_REVIEW_APPLICATION
    ADD high_pct_ext_case bit null,
        low_non_lsc_fund bit null,
        fund_non_reportable bit null,
        resource_intensive bit null,
        low_case_rate_other bit null,
        low_case_rate_comment varchar(max),
        other_csr_number_patterns bit null,
        low_extended_case_rate bit null,
        precipitous_drop_case_numbers bit null,
        csr_cms_finding bit null,
        other_csr_number_patterns_other bit null,
        other_csr_number_patterns_comment varchar(max),
        csr_analysis_conclusion_id int,
        csr_analysis_conclusion_comment varchar(max) 