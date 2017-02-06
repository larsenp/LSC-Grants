ALTER TABLE LSC_COMP_APPL_FISCAL
	ADD exp_fraud BIT
		,exp_misapprop BIT
		,exp_embezzlement BIT
		,exp_theft BIT
		,other_funder_sgc_resolved INT
		,other_funder_sgc_unresolved_desc VARCHAR(MAX)