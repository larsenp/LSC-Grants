CREATE PROCEDURE spLSC_TIG_COPY_GRANT_REQUEST_AMOUNT
	(@wf_task_assignment_id int)

AS

DECLARE @count int

SELECT @count = count(*)
	FROM LSC_TIG_APP
	WHERE wf_task_assignment_id = @wf_task_assignment_id

IF @count = 0
BEGIN
	DECLARE @new_id int
	EXEC @new_id = getid_sel
		@table='LSC_TIG_APP',
		@mode = 2

	INSERT INTO LSC_TIG_APP
           ([lsc_tig_app_id]
           ,[wf_task_assignment_id])
     VALUES
           (@new_id
           ,@wf_task_assignment_id)
END

DECLARE @grant_request int

SELECT @grant_request = grant_request
	FROM LSC_TIG_APP
	WHERE wf_task_assignment_id = @wf_task_assignment_id

IF @grant_request IS NULL

	UPDATE LSC_TIG_APP
		SET grant_request = tl.requested_amount
		FROM LSC_TIG_APP ta
			JOIN WF_TASK_ASSIGNMENT wfta_a ON ta.wf_task_assignment_id = wfta_a.wf_task_assignment_id
			JOIN WF_TASK_ASSIGNMENT wfta_l ON wfta_a.grantee_project_id = wfta_l.grantee_project_id
				AND wfta_l.wf_task_id in (31, 32, 33, 34, 36)
			JOIN LSC_TIG_LOI tl ON wfta_l.wf_task_assignment_id = tl.wf_task_assignment_id 
		WHERE ta.wf_task_assignment_id = @wf_task_assignment_id

