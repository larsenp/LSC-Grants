DECLARE @new_product_id INT

INSERT LSC_c_SOFTWARE_TYPE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(21
		,'FORMS'
		,'Automated Forms'
		,21)

UPDATE s_ID_GEN
	SET next_id = 22
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
		,21
		,'LawHelp Interactive '
		,'LawHelp Interactive '
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
		,21
		,'HotDocs'
		,'Desktop version of HotDocs'
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
		,21
		,'CASE MGMT'
		,'Forms capability in case management software'
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
		,21
		,'OTHER'
		,'Some other automated forms method'
		,4)

