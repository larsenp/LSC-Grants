INSERT INTO [LSC_c_FUND_BALANCE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'Yes'
           ,'Yes'
           ,1)

INSERT INTO [LSC_c_FUND_BALANCE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'No'
           ,'No'
           ,2)

INSERT INTO [LSC_c_FUND_BALANCE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (3
           ,'Not LSC-Funded'
           ,'Not LSC-Funded'
           ,3)

INSERT INTO [LSC_c_FUND_BALANCE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (4
           ,'Not Applicable'
           ,'Not Applicable'
           ,4)

UPDATE s_ID_GEN
	SET next_id = 5
	WHERE table_name = 'LSC_c_FUND_BALANCE'

