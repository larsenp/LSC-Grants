CREATE VIEW vLSC_TIG_CONTRACT

AS

SELECT lsc_tig_contract_id,
	ISNULL(contract_amount_tig, 0) + ISNULL(contract_amount_other, 0) contract_amount_total
	FROM lsc_tig_contract