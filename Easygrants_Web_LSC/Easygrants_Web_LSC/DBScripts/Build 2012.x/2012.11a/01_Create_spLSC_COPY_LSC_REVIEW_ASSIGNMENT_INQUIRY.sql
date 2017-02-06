CREATE PROCEDURE spLSC_COPY_LSC_REVIEW_ASSIGNMENT_INQUIRY
	(@source_wf_task_assignment_id int,
	@target_wf_task_assignment_id int)

AS

BEGIN TRAN
	--Copy inquiry responses
	DECLARE @next_id INT, @row_count INT

	CREATE TABLE #ids
		(source_id int,
		ident int identity(0,1))

	INSERT #ids (source_id)
		SELECT lsc_review_assignment_inquiry_id
			FROM LSC_REVIEW_ASSIGNMENT_INQUIRY
			WHERE wf_task_assignment_id = @source_wf_task_assignment_id

	SELECT @row_count = COUNT(*) 
		FROM #ids

	EXEC @next_id = spGETID_RANGE_SEL @table = 'LSC_REVIEW_ASSIGNMENT_INQUIRY', @count = @row_count, @mode = 2

	DELETE LSC_REVIEW_ASSIGNMENT_INQUIRY
		WHERE wf_task_assignment_id = @target_wf_task_assignment_id

	INSERT LSC_REVIEW_ASSIGNMENT_INQUIRY
		(lsc_review_assignment_inquiry_id,
		wf_task_assignment_id,
		lsc_review_inquiry_id,
		lsc_review_inquiry_score_id,
		comment)
		SELECT #ids.ident + @next_id,
			@target_wf_task_assignment_id,
			lsc_review_inquiry_id,
			lsc_review_inquiry_score_id,
			comment
			FROM LSC_REVIEW_ASSIGNMENT_INQUIRY lrai
				JOIN #ids ON lrai.lsc_review_assignment_inquiry_id = #ids.source_id

	TRUNCATE TABLE #ids

	INSERT #ids (source_id)
		SELECT lsc_review_assignment_element_id
			FROM LSC_REVIEW_ASSIGNMENT_ELEMENT
			WHERE wf_task_assignment_id = @source_wf_task_assignment_id

	SELECT @row_count = COUNT(*) 
		FROM #ids

	EXEC @next_id = spGETID_RANGE_SEL @table = 'LSC_REVIEW_ASSIGNMENT_ELEMENT', @count = @row_count, @mode = 2

	--Copy strong/weak element indicators
	DELETE LSC_REVIEW_ASSIGNMENT_ELEMENT
		WHERE wf_task_assignment_id = @target_wf_task_assignment_id

	INSERT LSC_REVIEW_ASSIGNMENT_ELEMENT
		(lsc_review_assignment_element_id,
		lsc_review_element_id,
		wf_task_assignment_id,
		checked)
		SELECT #ids.ident + @next_id,
			lsc_review_element_id,
			@target_wf_task_assignment_id,
			checked
			FROM LSC_REVIEW_ASSIGNMENT_ELEMENT lrae
				JOIN #ids ON lrae.lsc_review_assignment_element_id = #ids.source_id

	TRUNCATE TABLE #ids

COMMIT TRAN