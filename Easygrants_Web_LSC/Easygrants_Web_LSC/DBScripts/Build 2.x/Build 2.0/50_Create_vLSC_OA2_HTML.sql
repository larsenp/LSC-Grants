CREATE VIEW vLSC_OA2_HTML

AS

SELECT lsc_oa2_id,
	dbo.fnCRLF_to_br(part_2_comment) part_2_comment,
	dbo.fnCRLF_to_br(part_3_comment) part_3_comment,
	dbo.fnCRLF_to_br(part_4_comment) part_4_comment,
	dbo.fnCRLF_to_br(part_5_comment) part_5_comment,
	dbo.fnCRLF_to_br(special_grant_condition_language) special_grant_condition_language
	FROM LSC_OA2
