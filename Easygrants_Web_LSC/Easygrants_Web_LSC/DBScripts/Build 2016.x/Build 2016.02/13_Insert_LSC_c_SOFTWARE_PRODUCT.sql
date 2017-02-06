DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT', @mode = 2

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET sort_order = sort_order + 1
	WHERE software_type_id = 1
		and end_date is null
		and sort_order > 6

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_id
		,1
		,'WIN10'
		,'Windows 10'
		,7)

EXEC @new_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT', @mode = 2

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_id
		,4
		,'Off365'
		,'Office 365'
		,8)

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET sort_order = 9
	WHERE id = 22
