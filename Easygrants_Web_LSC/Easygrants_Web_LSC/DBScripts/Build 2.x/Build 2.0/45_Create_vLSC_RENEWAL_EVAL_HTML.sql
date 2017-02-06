CREATE VIEW vLSC_RENEWAL_EVAL_HTML

AS

SELECT lsc_renewal_eval_id,
	dbo.fnCRLF_to_br(comment_a) comment_a,
	dbo.fnCRLF_to_br(comment_d) comment_d,
	dbo.fnCRLF_to_br(comment_g) comment_g,
	dbo.fnCRLF_to_br(comment_i) comment_i,
	dbo.fnCRLF_to_br(comment_k) comment_k,
	dbo.fnCRLF_to_br(comment_l) comment_l,
	dbo.fnCRLF_to_br(app_overview_comment) app_overview_comment,
	dbo.fnCRLF_to_br(grantee_profile_comment) grantee_profile_comment,
	dbo.fnCRLF_to_br(oce_report_comment) oce_report_comment,
	dbo.fnCRLF_to_br(compliance_memo_comment) compliance_memo_comment,
	dbo.fnCRLF_to_br(program_profile_comment) program_profile_comment,
	dbo.fnCRLF_to_br(other_docs_comment) other_docs_comment
	FROM LSC_RENEWAL_EVAL