ALTER VIEW [dbo].[vLSC_COMP_APPL_FISCAL_VALIDATE]

AS

SELECT lsc_comp_appl_fiscal_id
	,CASE WHEN (bod_finance_committee = 1 or bod_audit_committee = 1) and (bod_audit_finance is not null and bod_audit_finance <> 3) THEN 1 ELSE 0 END p1_q3_must_not_answer
	,CASE WHEN (bod_finance_committee <> 1 and bod_audit_committee <> 1) and (bod_audit_finance is null or bod_audit_finance = 3) THEN 1 ELSE 0 END p1_q3_must_answer
	,ISNULL(exp_fraud, 0) | ISNULL(exp_misapprop, 0) | ISNULL(exp_embezzlement, 0) | ISNULL(exp_theft, 0) exp_fin_security_breach
	,CASE WHEN fraud_reported_oig = 1 OR fraud_reported_authorities = 1 THEN 1 ELSE 0 END fraud_reported
	FROM LSC_COMP_APPL_FISCAL

