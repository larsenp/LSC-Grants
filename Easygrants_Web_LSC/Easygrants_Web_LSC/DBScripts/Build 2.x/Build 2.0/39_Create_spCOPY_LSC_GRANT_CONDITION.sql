/****** Object:  StoredProcedure [dbo].[spCOPY_LSC_GRANT_CONDITION]    Script Date: 06/10/2008 10:46:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCOPY_LSC_GRANT_CONDITION]
	(@source_reviewed_wfta_id int,
	@target_reviewed_wfta_id int)

AS

	DECLARE @next_id INT, @row_count INT

	CREATE TABLE #ids
		(source_id int,
		ident int identity(0,1))

	INSERT #ids (source_id)
		SELECT lsc_grant_condition_id
			FROM LSC_GRANT_CONDITION
			WHERE reviewed_wf_task_assignment_id = @source_reviewed_wfta_id

	SELECT @row_count = COUNT(*) 
		FROM #ids

	EXEC @next_id = spGETID_RANGE_SEL @table = 'LSC_GRANT_CONDITION', @count = @row_count, @mode = 2

	DELETE LSC_GRANT_CONDITION
		WHERE reviewed_wf_task_assignment_id = @target_reviewed_wfta_id

	INSERT LSC_GRANT_CONDITION
		(lsc_grant_condition_id,
		reviewed_wf_task_assignment_id,
		lsc_grant_condition_type_id,
		comment)
		SELECT #ids.ident + @next_id,
			@target_reviewed_wfta_id,
			lsc_grant_condition_type_id,
			comment
			FROM LSC_GRANT_CONDITION lgc
				JOIN #ids ON lgc.lsc_grant_condition_id = #ids.source_id


