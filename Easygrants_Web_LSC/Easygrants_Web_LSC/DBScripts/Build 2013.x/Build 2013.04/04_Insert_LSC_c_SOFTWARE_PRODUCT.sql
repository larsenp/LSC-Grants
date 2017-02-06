
--Word Processing Software
UPDATE LSC_c_SOFTWARE_PRODUCT
   SET end_date = '1/1/2013'
   WHERE software_type_id = 4 and abbr = 'MSWORD'


INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (133
           ,4
           ,'Word03'
           ,'Word 2003'
           ,1)

INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (134
           ,4
           ,'Word07'
           ,'Word 2007'
           ,2)

INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (135
           ,4
           ,'Word10'
           ,'Word 2010'
           ,3)

INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (136
           ,4
           ,'Word13'
           ,'Word 2013'
           ,4)

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 5
   WHERE abbr = 'WP' and software_type_id = 4

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 6
   WHERE abbr = 'Open Office' and software_type_id = 4

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 7
   WHERE abbr = 'Google Docs/Apps' and software_type_id = 4

UPDATE LSC_c_SOFTWARE_PRODUCT
   SET sort_order = 8
   WHERE abbr = 'OTHER' and software_type_id = 4