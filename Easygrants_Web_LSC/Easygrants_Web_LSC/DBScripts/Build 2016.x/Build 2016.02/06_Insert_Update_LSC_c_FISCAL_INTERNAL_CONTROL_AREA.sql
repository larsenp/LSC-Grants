UPDATE LSC_c_FISCAL_INTERNAL_CONTROL_AREA
	SET end_date = '2016-1-1'
	WHERE id = 6

DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'LSC_c_FISCAL_INTERNAL_CONTROL_AREA', @mode = 2

INSERT LSC_c_FISCAL_INTERNAL_CONTROL_AREA
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_id
		,'Electronic Data Processing'
		,'Electronic Data Processing'
		,6)