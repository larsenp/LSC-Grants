EXEC spLSC_COPY_FUNDS
	@prev_year = '2012', 
	@new_year = '2013'

DELETE a_FUND
	WHERE fund_start_date = '2012-1-1'
		AND fund_description = 'MWV'
