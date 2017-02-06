CREATE VIEW vLSC_RENEWAL_REC_HTML

AS

SELECT lsc_renewal_rec_id,
	dbo.fnCRLF_to_br(further_review_comment) further_review_comment,
	dbo.fnCRLF_to_br(rationale_non_renewal) rationale_non_renewal,
	dbo.fnCRLF_to_br(special_grant_conditions) special_grant_conditions,
	dbo.fnCRLF_to_br(other_issues) other_issues
	FROM LSC_RENEWAL_REC