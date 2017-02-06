UPDATE a_FUND
	SET fund_description = 'LA-13'
	WHERE fund_name = 'LA-13 2015'

UPDATE a_FUND
	SET fund_description = 'MSX-2'
	WHERE fund_name = 'MSX-2 2015'

DELETE a_FUND
	WHERE fund_name IN ('mwv 2015', 'oh-5 2015', 'oh-17 2015')

EXEC spLSC_COPY_FUNDS
	@prev_year = '2015', 
	@new_year = '2016'
