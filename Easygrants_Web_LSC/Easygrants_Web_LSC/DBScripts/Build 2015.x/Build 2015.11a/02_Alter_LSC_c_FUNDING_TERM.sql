ALTER TABLE LSC_c_FUNDING_TERM
	ADD months INT

GO

UPDATE LSC_c_FUNDING_TERM
	SET months = 12
	WHERE abbr = '1-year'

UPDATE LSC_c_FUNDING_TERM
	SET months = 24
	WHERE abbr = '2-year'

UPDATE LSC_c_FUNDING_TERM
	SET months = 36
	WHERE abbr = '3-year'

UPDATE LSC_c_FUNDING_TERM
	SET months = 6
	WHERE abbr = '6-month'

UPDATE LSC_c_FUNDING_TERM
	SET months = 4
	WHERE abbr = '4-month'

UPDATE LSC_c_FUNDING_TERM
	SET months = 3
	WHERE abbr = '3-month'

UPDATE LSC_c_FUNDING_TERM
	SET months = 2
	WHERE abbr = '2-month'

UPDATE LSC_c_FUNDING_TERM
	SET months = 1
	WHERE abbr = '1-month'

