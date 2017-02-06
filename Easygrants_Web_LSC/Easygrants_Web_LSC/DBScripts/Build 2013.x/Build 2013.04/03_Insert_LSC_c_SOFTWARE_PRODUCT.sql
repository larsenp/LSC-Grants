

--Internet Browsers
UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 3 and abbr = 'Internet Explorer'

UPDATE LSC_c_SOFTWARE_PRODUCT
	SET end_date = '1/1/2013'
	WHERE software_type_id = 3 and abbr = 'OPERA'


INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (129
           ,3
           ,'Internet Explorer 7'
           ,'Internet Explorer 7'
           ,1)

INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (130
           ,3
           ,'Internet Explorer 8'
           ,'Internet Explorer 8'
           ,2)


INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (131
           ,3
           ,'Internet Explorer 9'
           ,'Internet Explorer 9'
           ,3)

INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (132
           ,3
           ,'Internet Explorer 10'
           ,'Internet Explorer 10'
           ,4)


UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 5
   WHERE abbr = 'MOZILLA' and software_type_id = 3

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 6
   WHERE abbr = 'Chrome' and software_type_id = 3

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 7
   WHERE abbr = 'Safari' and software_type_id = 3

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 8
   WHERE abbr = 'OTHER' and software_type_id = 3