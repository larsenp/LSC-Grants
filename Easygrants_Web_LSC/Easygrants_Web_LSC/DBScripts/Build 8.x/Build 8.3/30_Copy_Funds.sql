--Populate fund_description with service area name. This will facilitate a join with the AWARD table from RINDB.
UPDATE a_fund
	SET fund_description = replace(fund_name, ' 2010', '')
	WHERE fund_name like '%2010%'


EXEC spLSC_COPY_FUNDS
	@prev_year = '2010', 
	@new_year = '2011'
	
DELETE a_FUND
	WHERE fund_name = 'MHI 2011'
		OR fund_name = 'TIG 2011'
