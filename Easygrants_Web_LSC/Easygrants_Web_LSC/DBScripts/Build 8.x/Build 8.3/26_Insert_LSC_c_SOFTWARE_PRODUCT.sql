UPDATE [dbo].[LSC_c_SOFTWARE_PRODUCT]
   SET [sort_order] = 6
   WHERE [abbr] = 'WINOTHER' and [software_type_id]= 1

UPDATE [dbo].[LSC_c_SOFTWARE_PRODUCT]
   SET [sort_order] = 7
   WHERE [abbr] = 'LINUX' and [software_type_id]= 1

UPDATE [dbo].[LSC_c_SOFTWARE_PRODUCT]
   SET [sort_order] = 8
   WHERE [abbr] = 'MAC' and [software_type_id]= 1

UPDATE [dbo].[LSC_c_SOFTWARE_PRODUCT]
   SET [sort_order] = 9
   WHERE [abbr] = 'OTHER' and [software_type_id]= 1


INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (112
           ,1
           ,'WINVISTA'
           ,'Windows Vista'
           ,4)

INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (113
           ,1
           ,'WIN7'
           ,'Windows 7'
           ,5)


UPDATE [dbo].[LSC_c_SOFTWARE_PRODUCT]
   SET [description] = 'Outlook Express or Windows Live Mail'
   WHERE [abbr] = 'OUTLOOKEXP' and [software_type_id]= 2

UPDATE [dbo].[LSC_c_SOFTWARE_PRODUCT]
   SET [sort_order] = 9
   WHERE [abbr] = 'OTHER' and [software_type_id]= 2

INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (114
           ,2
           ,'Gmail'
           ,'Gmail'
           ,8)



UPDATE [dbo].[LSC_c_SOFTWARE_PRODUCT]
   SET [sort_order] = 7
   WHERE [abbr] = 'OTHER' and [software_type_id]= 3

INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (115
           ,3
           ,'Chrome'
           ,'Chrome'
           ,5)

INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (116
           ,3
           ,'Safari'
           ,'Safari'
           ,6)


UPDATE [dbo].[LSC_c_SOFTWARE_PRODUCT]
   SET [description] = 'Open Office'
   WHERE [abbr] = 'STAR/OPEN' and [software_type_id]= 4


UPDATE [dbo].[LSC_c_SOFTWARE_PRODUCT]
   SET [sort_order] = 5
   WHERE [abbr] = 'OTHER' and [software_type_id]= 4

INSERT INTO [dbo].[LSC_c_SOFTWARE_PRODUCT]
           ([id]
           ,[software_type_id]
           ,[abbr]
           ,[description]
           ,[sort_order])
  VALUES
           (117
           ,4
           ,'Google Apps'
           ,'Google Apps'
           ,4)



--select * from LSC_c_SOFTWARE_PRODUCT where [software_type_id]= 4 order by sort_order
