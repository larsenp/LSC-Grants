EXEC spLSC_COPY_FUNDS
	@prev_year = '2014', 
	@new_year = '2015'

UPDATE a_FUND
	SET fund_amount = 
		(SELECT fund_amount
			FROM a_FUND
			WHERE fund_name = 'LA-13 2014')
	WHERE fund_name = 'LA-13 2015'

UPDATE a_FUND
	SET fund_amount = 
		(SELECT fund_amount
			FROM a_FUND
			WHERE fund_name = 'MSX-2 2014')
	WHERE fund_name = 'MSX-2 2015'

DELETE a_FUND
	WHERE fund_name in ('LA-1 2015', 'LA-12 2015', 'MAL 2015', 'MAR 2015', 'MKY 2015', 'MLA 2015', 'MMS 2015', 'MTN 2015', 'MTX 2015')
