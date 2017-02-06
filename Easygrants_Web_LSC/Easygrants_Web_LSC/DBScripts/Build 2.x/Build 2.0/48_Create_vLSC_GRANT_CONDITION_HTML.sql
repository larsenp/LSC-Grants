CREATE VIEW vLSC_GRANT_CONDITION_HTML

AS

SELECT lsc_grant_condition_id,
	dbo.fnCRLF_to_br(comment) comment
	FROM LSC_GRANT_CONDITION