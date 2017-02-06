UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '2014-1-1'
	WHERE id IN (129, 130, 131, 132)

DECLARE @new_id INT
EXEC @new_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT'
	,@mode = 2

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_id
		,3
		,'IE8-'
		,'Internet Explorer 8 or earlier'
		,1)

EXEC @new_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT'
	,@mode = 2

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_id
		,3
		,'IE9+'
		,'Internet Explorer 9 or later'
		,1)
