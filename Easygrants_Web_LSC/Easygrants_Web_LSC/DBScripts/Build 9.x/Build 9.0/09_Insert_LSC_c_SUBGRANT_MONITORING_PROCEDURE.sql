INSERT INTO [LSC_c_SUBGRANT_MONITORING_PROCEDURE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'On-Site'
           ,'On-Site Visit'
           ,1)

INSERT INTO [LSC_c_SUBGRANT_MONITORING_PROCEDURE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'Review'
           ,'Review of Legal Work'
           ,2)

INSERT INTO [LSC_c_SUBGRANT_MONITORING_PROCEDURE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (3
           ,'Monitor Stats'
           ,'Monitor Case Statistics'
           ,3)

INSERT INTO [LSC_c_SUBGRANT_MONITORING_PROCEDURE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (4
           ,'Financial'
           ,'Financial Report Reviewed'
           ,4)

INSERT INTO [LSC_c_SUBGRANT_MONITORING_PROCEDURE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (5
           ,'Progress Report'
           ,'Monthly or Quarterly Progress Report'
           ,5)

INSERT INTO [LSC_c_SUBGRANT_MONITORING_PROCEDURE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (6
           ,'Monthly'
           ,'Monthly'
           ,6)

INSERT INTO [LSC_c_SUBGRANT_MONITORING_PROCEDURE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (7
           ,'Quarterly'
           ,'Quarterly'
           ,7)

INSERT INTO [LSC_c_SUBGRANT_MONITORING_PROCEDURE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (8
           ,'Other'
           ,'Other'
           ,8)

UPDATE s_ID_GEN
	SET next_id = 9
	WHERE table_name = 'LSC_c_SUBGRANT_MONITORING_PROCEDURE'
