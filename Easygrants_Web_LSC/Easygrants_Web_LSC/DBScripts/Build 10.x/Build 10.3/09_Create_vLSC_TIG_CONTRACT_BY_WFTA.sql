CREATE VIEW vLSC_TIG_CONTRACT_BY_WFTA

AS

SELECT wf_task_assignment_id,
	SUM(contract_amount_tig) contract_amount_tig,
	SUM(contract_amount_other) contract_amount_other,
	SUM(ISNULL(contract_amount_tig, 0) + ISNULL(contract_amount_other, 0)) contract_amount_total
	FROM LSC_TIG_CONTRACT
	GROUP BY wf_task_assignment_id
