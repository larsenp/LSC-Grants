ALTER TABLE LSC_c_TIG_GRANT_TYPE 
	ADD loi_wf_task_id int NULL

GO

UPDATE LSC_c_TIG_GRANT_TYPE 
	SET loi_wf_task_id = 31
	WHERE id = 6

UPDATE LSC_c_TIG_GRANT_TYPE 
	SET loi_wf_task_id = 32
	WHERE id = 9

UPDATE LSC_c_TIG_GRANT_TYPE 
	SET loi_wf_task_id = 33
	WHERE id = 2

UPDATE LSC_c_TIG_GRANT_TYPE 
	SET loi_wf_task_id = 34
	WHERE id = 17

INSERT INTO [LSC_c_TIG_GRANT_TYPE]
           ([id]
           ,[description]
           ,[sort_order]
           ,[loi_wf_task_id])
     VALUES
           (18
           ,'Website Improvement and Innovation'
           ,9
           ,36)

UPDATE s_ID_GEN
	SET next_id = 19
	WHERE table_name = 'LSC_c_TIG_GRANT_TYPE'