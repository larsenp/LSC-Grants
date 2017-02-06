CREATE PROCEDURE spLSC_XFER_TIG_PAYMENT_SCHEDULE_BETWEEN_WFTAS
	@source_wfta_id int,
	@target_wfta_id int

AS

DECLARE @new_id int,
	@rowcount int

CREATE TABLE #pps(
	ident int identity(0,1),
	lsc_tig_proposed_payment_schedule_id int NULL,
	wf_task_assignment_id int NULL,
	payment_number int NULL,
	payment_date datetime NULL,
	payment_amount int NULL,
	applicant_comment varchar(max) NULL)

INSERT #pps
		   (wf_task_assignment_id
		   ,payment_number
		   ,payment_date
		   ,payment_amount
		   ,applicant_comment)
	SELECT @target_wfta_id
		  ,payment_number
		  ,payment_date
		  ,payment_amount
		  ,applicant_comment
		FROM LSC_TIG_PROPOSED_PAYMENT_SCHEDULE
		WHERE wf_task_assignment_id = @source_wfta_id

SET @rowcount = @@ROWCOUNT

EXEC @new_id = spGETID_RANGE_SEL
	@table = 'LSC_TIG_PROPOSED_PAYMENT_SCHEDULE',
	@count = @rowcount,
	@mode = 2

UPDATE #pps
	SET lsc_tig_proposed_payment_schedule_id = ident + @new_id

INSERT LSC_TIG_PROPOSED_PAYMENT_SCHEDULE
		   (lsc_tig_proposed_payment_schedule_id
		   ,wf_task_assignment_id
		   ,payment_number
		   ,payment_date
		   ,payment_amount
		   ,applicant_comment)
	SELECT lsc_tig_proposed_payment_schedule_id
		  ,wf_task_assignment_id
		  ,payment_number
		  ,payment_date
		  ,payment_amount
		  ,applicant_comment
		FROM #pps
