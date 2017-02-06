--Reallocate money from discontinued service areas

UPDATE a_FUND
	SET fund_amount = 2187314
	WHERE fund_name = 'NV-1 2012'

DELETE a_FUND
	WHERE fund_name = 'MNV 2012'

UPDATE a_FUND
	SET fund_amount = 552962
	WHERE fund_name = 'SD-4 2012'

UPDATE a_FUND
	SET fund_amount = 466856
	WHERE fund_name = 'SD-2 2012'

DELETE a_FUND
	WHERE fund_name = 'MSD 2012'

UPDATE a_FUND
	SET fund_amount = 2741827
	WHERE fund_name = 'KS-1 2012'

DELETE a_FUND
	WHERE fund_name = 'MKS 2012'

UPDATE a_FUND
	SET fund_amount = 582514
	WHERE fund_name = 'WY-4 2012'

DELETE a_FUND
	WHERE fund_name = 'MWY 2012'

