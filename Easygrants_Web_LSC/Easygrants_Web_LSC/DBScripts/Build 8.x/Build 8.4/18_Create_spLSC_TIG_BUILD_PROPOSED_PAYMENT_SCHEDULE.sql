CREATE PROCEDURE spLSC_TIG_BUILD_PROPOSED_PAYMENT_SCHEDULE
	(@wf_task_assignment_id INT)

AS

DECLARE @grant_term INT, @grant_year INT

SELECT @grant_term = grant_term_months 
	FROM LSC_TIG_APP
	WHERE wf_task_assignment_id = @wf_task_assignment_id

IF @grant_term IS NULL
	RETURN

SELECT @grant_year = tp.sort_order
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN c_TIME_PERIOD tp ON wfp.time_period_id = tp.id
	WHERE wfta.wf_task_assignment_id = @wf_task_assignment_id


CREATE TABLE #payments
	(payment_number int,
	months int,
	payment_date datetime)

DECLARE @first_date DATETIME

SET @first_date = CAST(CAST(@grant_year + 1 AS VARCHAR(4)) + '-1-1' AS DATETIME)

INSERT #payments
	(payment_number ,
	months ,
	payment_date)
	VALUES(1,
		0,
		@first_date)

DECLARE @payment_number INT, @months INT

SET @payment_number = 2

SET @months = 6

WHILE @months <= @grant_term
BEGIN
	INSERT #payments
		(payment_number ,
		months ,
		payment_date)
		VALUES(@payment_number,
			@months,
			@first_date)

	SET @payment_number = @payment_number + 1
	SET @months = @months + 6
END

SET @months = @months - 3

INSERT #payments
	(payment_number ,
	months ,
	payment_date)
	VALUES(@payment_number,
		@months,
		@first_date)


select @grant_term grant_term, 
	@grant_year grant_year, 
	@first_date first_date ,
	@payment_number payment_number,
	@months months

UPDATE #payments
	SET payment_date = DATEADD(d, -1, DATEADD(m, months, payment_date))
	WHERE payment_number > 1

DECLARE @first_id INT, @row_count INT

SELECT @row_count = count(*) FROM #payments

exec @first_id = [spGETID_RANGE_SEL]
	@table = 'LSC_TIG_PROPOSED_PAYMENT_SCHEDULE',
	@count = @row_count,
	@mode = 2

INSERT INTO [LSC_TIG_PROPOSED_PAYMENT_SCHEDULE]
           ([lsc_tig_proposed_payment_schedule_id]
           ,[wf_task_assignment_id]
           ,[payment_number]
           ,[payment_date])
     SELECT @first_id + payment_number - 1,
		@wf_task_assignment_id,
		payment_number,
		payment_date
		FROM #payments

select * from #payments

drop table #payments
