ALTER TABLE LSC_TIG_BUDGET
	ADD lsc_tig_budget_type_id INT

GO

UPDATE LSC_TIG_BUDGET
	SET lsc_tig_budget_type_id = 1