CREATE VIEW vLSC_OA1_HTML

AS

SELECT lsc_oa1_id,
	dbo.fnCRLF_to_br(comment_II_C) comment_II_C,
	dbo.fnCRLF_to_br(comment_II_C_11) comment_II_C_11,
	dbo.fnCRLF_to_br(comment_III) comment_III
	FROM LSC_OA1
