--Email
UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '2015-1-1'
	WHERE id in (3, 12, 13, 114)

DECLARE @new_id INT

EXEC @new_id = getid_sel @table ='LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES(@new_id
		,2
		,'GOOGLEAPP'
		,'Google Apps'
		,6)

EXEC @new_id = getid_sel @table ='LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES(@new_id
		,2
		,'EXCHANGELOC'
		,'MS Exchange (Local)'
		,1)

EXEC @new_id = getid_sel @table ='LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES(@new_id
		,2
		,'EXCHANGEHOST'
		,'MS Exchange (Hosted, not Office 365)'
		,2)

EXEC @new_id = getid_sel @table ='LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES(@new_id
		,2
		,'EXCHANGE365'
		,'MS Exchange (Office 365)'
		,3)

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET sort_order = sort_order + 2
	WHERE software_type_id = 2
		AND end_date IS NULL
		AND abbr LIKE 'OUTLOOK%'


--Accounting		
UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '2015-1-1'
	WHERE id IN (58, 140, 91, 96, 74, 56)

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET description = 'FundWare'
	WHERE id = 72

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET description = 'CYMA Not for Profit'
	WHERE id = 64

EXEC @new_id = getid_sel @table ='LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES(@new_id
		,8
		,'MS Dynamics'
		,'MS Dynamics (Solomon/Great Plains/Navison)'
		,10)

EXEC @new_id = getid_sel @table ='LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES(@new_id
		,8
		,'Abila'
		,'Abila MIP Fund Accounting'
		,1)

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET sort_order = sort_order + 1
	WHERE id IN (139, 55)
	
--Legal Research
EXEC @new_id = getid_sel @table ='LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES(@new_id
		,13
		,'FastCase'
		,'FastCase'
		,3)

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET sort_order = 9
	WHERE id = 41

--Remote Access
EXEC @new_id = getid_sel @table ='LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES(@new_id
		,15
		,'RDS'
		,'Remote Desktop Services'
		,7)

EXEC @new_id = getid_sel @table ='LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id
	,software_type_id
	,abbr
	,description
	,sort_order)
	VALUES(@new_id
		,15
		,'CHROME RD'
		,'Chrome Remote Desktop'
		,8)

