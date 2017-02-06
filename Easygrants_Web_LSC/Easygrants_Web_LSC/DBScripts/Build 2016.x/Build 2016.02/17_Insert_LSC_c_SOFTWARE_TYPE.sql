DECLARE @new_product_id INT

INSERT LSC_c_SOFTWARE_TYPE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(20
		,'SOCIAL MEDIA'
		,'Social Media'
		,20)

UPDATE s_ID_GEN
	SET next_id = 21
	WHERE table_name = 'LSC_c_SOFTWARE_TYPE'

EXEC @new_product_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT', @mode = 2

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_product_id
		,20
		,'Facebook'
		,'Facebook'
		,1)

EXEC @new_product_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT', @mode = 2

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_product_id
		,20
		,'Twitter'
		,'Twitter'
		,2)

EXEC @new_product_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT', @mode = 2

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_product_id
		,20
		,'YouTube'
		,'YouTube'
		,3)

EXEC @new_product_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT', @mode = 2

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_product_id
		,20
		,'Instagram'
		,'Instagram'
		,4)

EXEC @new_product_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT', @mode = 2

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_product_id
		,20
		,'Google+'
		,'Google+'
		,5)

EXEC @new_product_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT', @mode = 2

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_product_id
		,20
		,'Other'
		,'Other'
		,6)

