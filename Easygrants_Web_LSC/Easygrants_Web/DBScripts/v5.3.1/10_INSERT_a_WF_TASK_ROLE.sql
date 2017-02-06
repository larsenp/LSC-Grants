/*
Developer		: 	Harish Avula
Date			:	04/29/2009
Modification	:	Inserted new role as per request Nuan and Sumanth
*/


INSERT INTO [a_WF_TASK_ROLE]([id], [abbr], [description], [sort_order], [task_type_id], [is_default]) 
	VALUES(117, 'MENTOR', 'Mentor', NULL, 6, 0);



UPDATE s_id_gen set next_id = 118 where table_name='a_WF_TASK_ROLE';

GO

