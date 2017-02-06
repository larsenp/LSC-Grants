
--Accounting
UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'ACCPAC/Sage ERP'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'ACCPAC PLUS INTL'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'ACS'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'AXCENT'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'BUCS'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Sage Business Works'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Champion'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Cougar Mountain'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'CYMA Accounting'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'DYNAMICS'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Executive Data Sys'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Focus on Business'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'FOR FUND'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Fund Acctg SW Series'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Grants Mgmt System'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Institutional Data S'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Kenrick'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Lotus Spreadsheet'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Management Assist, I'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Management Informati'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Sage MAS 90'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Midwest Computer Cen'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Omni Flex Software P'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'One Write Plus'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Open Systems'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Open Sys Traverse'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Sage Peachtree/50'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Sage 100'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'PICK'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Quick Books'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Quick Books Pro'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Red Wing'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'TRLA Accounting Syst'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Visual Account'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 8 and abbr = 'Mate Version'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = Null, sort_order = 11
	WHERE software_type_id = 8 and abbr = 'MIP'


INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (137
           ,8
           ,'Sage products'
           ,'Sage products'
           ,16)

INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (138
           ,8
           ,'Quick Books products'
           ,'Quick Books products'
           ,14)

INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (139
           ,8
           ,'Accufund'
           ,'Accufund'
           ,1)

INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (140
           ,8
           ,'eTapestry'
           ,'eTapestry'
           ,6)

INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (141
           ,8
           ,'Custom/Proprietary'
           ,'Custom/Proprietary'
           ,18)

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 2
   WHERE abbr = 'ADP FIXED ASSET' and software_type_id = 8

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 3
   WHERE abbr = 'AMERICAN FUNDWARE' and software_type_id = 8

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 4
   WHERE abbr = 'BLACKBAUD' and software_type_id = 8

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 5
   WHERE abbr = 'CYMA NOT FOR PROFIT' and software_type_id = 8

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 7
   WHERE abbr = 'Excel Spreadsheets' and software_type_id = 8

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 8
   WHERE abbr = 'Fund EZ' and software_type_id = 8

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 9
   WHERE abbr = 'Fundware' and software_type_id = 8

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 10
   WHERE abbr = 'Great Plains' and software_type_id = 8

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 12
   WHERE abbr = 'Open Systems Account' and software_type_id = 8

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 13
   WHERE abbr = 'Quattro Pro (Qpro)' and software_type_id = 8

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 15
   WHERE abbr = 'Quicken' and software_type_id = 8

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 17
   WHERE abbr = 'Solomon' and software_type_id = 8

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 19
   WHERE abbr = 'OTHER' and software_type_id = 8




