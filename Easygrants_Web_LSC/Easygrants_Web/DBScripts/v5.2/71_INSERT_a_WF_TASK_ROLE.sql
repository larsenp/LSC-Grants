DECLARE @id INT;

EXECUTE  getid_sel 'a_WF_TASK_ROLE' , @id OUTPUT,2

INSERT INTO [a_WF_TASK_ROLE]([id], [abbr], [description], [sort_order], [task_type_id], [is_default]) 
	VALUES(@id , 'Applicant', 'Applicant', Null, '6', 'False');

RETURN
GO

