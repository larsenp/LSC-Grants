--Remove Windows 98, Windows (Other), Netscape Navigator, DYNAMICS, Management Information Products, Micro Information Products (MIP),
--Open Systems
UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '2012-1-1'
	WHERE id in (1, 6, 16, 65, 79, 81, 85)
	
--Add new type for online meeting software
INSERT LSC_c_SOFTWARE_TYPE
	(id, abbr, description, sort_order)
	VALUES(18, 
		'WEB CONFERENCE',
		'Web Conference/Online Meeting',
		18)

UPDATE s_ID_GEN
	SET next_id = 19
	WHERE table_name = 'LSC_c_SOFTWARE_TYPE'

--Add online meeting software products
DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id,
	software_type_id,
	abbr,
	description,
	sort_order)
	VALUES(@new_id,
	18,
	'GotoMeeting',
	'GotoMeeting',
	1)
	
EXEC @new_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id,
	software_type_id,
	abbr,
	description,
	sort_order)
	VALUES(@new_id,
	18,
	'GotoWebinar',
	'GotoWebinar',
	2)
	
EXEC @new_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id,
	software_type_id,
	abbr,
	description,
	sort_order)
	VALUES(@new_id,
	18,
	'WebEx',
	'WebEx',
	3)
	
EXEC @new_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id,
	software_type_id,
	abbr,
	description,
	sort_order)
	VALUES(@new_id,
	18,
	'MS Live Meeting',
	'Microsoft Live Meeting',
	4)
	
EXEC @new_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id,
	software_type_id,
	abbr,
	description,
	sort_order)
	VALUES(@new_id,
	18,
	'Global Meet',
	'Global Meet',
	5)
	
EXEC @new_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id,
	software_type_id,
	abbr,
	description,
	sort_order)
	VALUES(@new_id,
	18,
	'ReadyTalk',
	'ReadyTalk',
	6)
	
EXEC @new_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id,
	software_type_id,
	abbr,
	description,
	sort_order)
	VALUES(@new_id,
	18,
	'Mikogo',
	'Mikogo',
	7)
	
EXEC @new_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id,
	software_type_id,
	abbr,
	description,
	sort_order)
	VALUES(@new_id,
	18,
	'AnyMeeting',
	'AnyMeeting',
	8)
	
EXEC @new_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id,
	software_type_id,
	abbr,
	description,
	sort_order)
	VALUES(@new_id,
	18,
	'Other',
	'Other',
	9)
	
--Add Windows 8 (os), Salesforce (accounting), online meeting products
EXEC @new_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT'

INSERT LSC_c_SOFTWARE_PRODUCT
	(id,
	software_type_id,
	abbr,
	description,
	sort_order)
	VALUES(@new_id,
	1,
	'Windows 8',
	'Windows 8',
	6)
	
EXEC @new_id = getid_sel @table = 'LSC_c_SOFTWARE_PRODUCT'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET sort_order = sort_order + 1
	WHERE end_date IS NULL
		AND software_type_id = 7
		AND sort_order > 6

INSERT LSC_c_SOFTWARE_PRODUCT
	(id,
	software_type_id,
	abbr,
	description,
	sort_order)
	VALUES(@new_id,
	7,
	'Salesforce',
	'Salesforce',
	7)


--Change Mac to Mac OS X, MS Explorer to Internet Explorer, Open Office to Open Office/Libre Office, Google Apps to Google Docs/Google Apps, 
--ACCPAC to ACCPAC/Sage ERP, Business Works to Sage Business Works, Great Plains to Microsoft Dynamics GP/Great Plains, MAS 90 to Sage MAS 90, 
--Peachtree to Sage Peachtree/Sage 50, Peachtree Complete Accounting to Sage Fund Accounting (MIP)/Sage 100

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET abbr = 'Mac OS X',
		description = 'Mac OS X'
	WHERE id = 8

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET abbr = 'Internet Explorer',
		description = 'Internet Explorer'
	WHERE id = 17

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET abbr = 'Open Office',
		description = 'Open Office/Libre Office'
	WHERE id = 21

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET abbr = 'Google Docs/Apps',
		description = 'Google Docs/Google Apps'
	WHERE id = 117

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET abbr = 'ACCPAC/Sage ERP',
		description = 'ACCPAC/Sage ERP'
	WHERE id = 42

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET abbr = 'Sage Business Works',
		description = 'Sage Business Works'
	WHERE id = 60

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET abbr = 'Great Plains',
		description = 'Microsoft Dynamics GP/Great Plains'
	WHERE id = 74

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET abbr = 'Sage MAS 90',
		description = 'Sage MAS 90'
	WHERE id = 80

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET abbr = 'Sage Peachtree/50',
		description = 'Sage Peachtree/Sage 50'
	WHERE id = 88

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET abbr = 'Sage 100',
		description = 'Sage Fund Accounting (MIP)/Sage 100'
	WHERE id = 89

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET abbr = 'Open Sys Traverse',
		description = 'Open Systems Traverse'
	WHERE id = 87
