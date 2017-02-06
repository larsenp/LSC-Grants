DECLARE @new_product_id INT

UPDATE LSC_c_SOFTWARE_TYPE
	SET sort_order = sort_order + 1
	WHERE sort_order > 7

INSERT LSC_c_SOFTWARE_TYPE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(19
		,'DATA ANALYSIS'
		,'Data Analysis/Visualization'
		,8)

UPDATE s_ID_GEN
	SET next_id = 20
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
		,19
		,'DB/SS'
		,'Database/spreadsheet applications (Excel, Access, etc.)'
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
		,19
		,'Statistical'
		,'Statistical software (SPSS, Stata, R, etc.)'
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
		,19
		,'GIS'
		,'GIS applications (ArcGIS, QGIS, Google Fusion Tables, etc.)'
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
		,19
		,'DATA VIZ'
		,'Data visualization tools (Tableau, Domo, etc.)'
		,4)

