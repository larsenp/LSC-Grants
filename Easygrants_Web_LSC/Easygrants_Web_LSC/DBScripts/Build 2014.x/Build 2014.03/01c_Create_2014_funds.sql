DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'a_FUND'
	,@mode = 2

INSERT a_FUND
	(fund_id
	,fund_name
	,fund_account_number
	,fund_amount
	,fund_start_date
	,fund_end_date
	,create_date
	,fund_source_type_id)
	SELECT @new_id
		,'LA-13 2014'
		,1
		,SUM(amount)
		,'2014-1-1'
		,'2014-12-31'
		,GETDATE()
		,1
		FROM [LSC-SQL].RINDB.dbo.award
		WHERE Year = 2014
			AND Serv_Area_ID IN ('LA-1', 'LA-12')

EXEC @new_id = getid_sel @table = 'a_FUND'
	,@mode = 2

INSERT a_FUND
	(fund_id
	,fund_name
	,fund_account_number
	,fund_amount
	,fund_start_date
	,fund_end_date
	,create_date
	,fund_source_type_id)
	SELECT @new_id
		,'MSX-2 2014'
		,1
		,SUM(amount)
		,'2014-1-1'
		,'2014-12-31'
		,GETDATE()
		,1
		FROM [LSC-SQL].RINDB.dbo.award
		WHERE Year = 2014
			AND Serv_Area_ID IN ('MAL', 'MAR', 'MKY', 'MLA', 'MMS', 'MTN', 'MTX')

