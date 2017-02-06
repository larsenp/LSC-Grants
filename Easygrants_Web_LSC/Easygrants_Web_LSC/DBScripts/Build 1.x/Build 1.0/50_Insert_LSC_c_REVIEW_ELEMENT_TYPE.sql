INSERT INTO [Easygrants].[dbo].[LSC_c_REVIEW_ELEMENT_TYPE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'Strong'
           ,'Strong'
           ,1)

INSERT INTO [Easygrants].[dbo].[LSC_c_REVIEW_ELEMENT_TYPE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'Weak'
           ,'Weak'
           ,2 )

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_c_REVIEW_ELEMENT_TYPE', 3, 1)
