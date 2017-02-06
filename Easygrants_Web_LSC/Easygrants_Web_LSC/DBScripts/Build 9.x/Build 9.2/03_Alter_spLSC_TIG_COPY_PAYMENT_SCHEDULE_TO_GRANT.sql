/****** Object:  StoredProcedure [dbo].[spLSC_TIG_COPY_PAYMENT_SCHEDULE_TO_GRANT]    Script Date: 10/21/2010 16:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spLSC_TIG_COPY_PAYMENT_SCHEDULE_TO_GRANT]
	(@wfta_id int)

AS

DECLARE @grantee_project_id int,
	@wf_task_id int,
	@grant_year varchar(4),
	@start_date datetime,
	@first_id int,
	@rowcount int

--Get ID of current grantee project
SELECT @grantee_project_id = grantee_project_id,
	@wf_task_id = wf_task_id
	FROM WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @wfta_id


--Build temp table for payments (including LSC_PAYMENT and milestones)
SELECT pps.lsc_tig_proposed_payment_schedule_id,
	wfta.grantee_project_id,
	pps.payment_number,
	1000 request_status_id,
	pps.payment_date requested_date,
	pps.payment_amount requested_amount,
	pps.applicant_comment milestone
	INTO #pps
	FROM LSC_TIG_PROPOSED_PAYMENT_SCHEDULE pps
		JOIN WF_TASK_ASSIGNMENT wfta ON pps.wf_task_assignment_id = wfta.wf_task_assignment_id
	WHERE pps.wf_task_assignment_id = @wfta_id

--Add columns for key and calculated values
ALTER TABLE #pps
	ADD ident int identity(0,1),
		payment_id int,
		period_start datetime,
		lsc_payment_id int,
		lsc_milestone_id int

--Set period start based on end date of prior period
UPDATE p_after
	SET period_start = DATEADD(d, 1, p_before.requested_date)
	FROM #pps p_after
		JOIN #pps p_before on p_after.ident = p_before.ident + 1

UPDATE #pps
	SET period_start = requested_date
	WHERE payment_number = 1

--Match application payment records with existing payment records, if any
UPDATE #pps
	SET payment_id = p.payment_id
	FROM PAYMENT p
		JOIN #pps ON p.payment_number = #pps.payment_number
	WHERE p.grantee_project_id = @grantee_project_id

UPDATE #pps
	SET lsc_payment_id = lp.lsc_payment_id
	FROM #pps
		JOIN LSC_PAYMENT lp on #pps.payment_id = lp.payment_id


--Build temp table for task assignments
----Get current grant year for task assignment start date
SELECT @grant_year = tp.sort_order
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN c_TIME_PERIOD tp ON wfp.time_period_id = tp.id
	WHERE wfta.wf_task_assignment_id = @wfta_id

SET @start_date = CAST(@grant_year + '-1-1' AS datetime)

CREATE TABLE #wfta
	(payment_number int,
	wf_task_id int,
	wf_task_status_id int,
	wf_task_outcome_id int,
	grantee_project_id int,
	person_id int,
	wf_task_role_id int,
	[start_date] datetime,
	open_date datetime,
	due_date datetime,
	ident int identity(0,1),
	wf_task_assignment_id int,
	payment_contingency_id int)


INSERT #wfta
	(payment_number,
	wf_task_id ,
	wf_task_status_id ,
	wf_task_outcome_id ,
	grantee_project_id ,
	person_id ,
	wf_task_role_id ,
	[start_date] ,
	open_date ,
	due_date )
	SELECT pps.payment_number,
		30 wf_task_id,
		1 wf_task_status_id,
		59 wf_task_outcome_id,
		wfta.grantee_project_id,
		wfta.person_id,
		8 wf_task_role_id,
		@start_date [start_date],
		@start_date open_date,
		DATEADD(d, 30, pps.payment_date) due_date
		FROM LSC_TIG_PROPOSED_PAYMENT_SCHEDULE pps
			JOIN WF_TASK_ASSIGNMENT wfta ON pps.wf_task_assignment_id = wfta.wf_task_assignment_id
		WHERE pps.wf_task_assignment_id = @wfta_id
			AND pps.payment_number > 1

--Match table rows up with existing contingencies and task assignments
UPDATE #wfta
	SET wf_task_assignment_id = wfta.wf_task_assignment_id,
		payment_contingency_id = pct.payment_contingency_id
	FROM #wfta
		JOIN PAYMENT p ON #wfta.grantee_project_id = p.grantee_project_id
			AND #wfta.payment_number = p.payment_number
		JOIN PAYMENT_CONTINGENCY_TASKS pct on p.payment_id = pct.payment_id
		JOIN WF_TASK_ASSIGNMENT wfta ON pct.contingency_task_assignment_id = wfta.wf_task_assignment_id
		WHERE wfta.grantee_project_id = @grantee_project_id


--Do update and insert to PAYMENT
----Prepare IDs
SELECT @rowcount = COUNT(*)
	FROM #pps

EXEC @first_id = spGETID_RANGE_SEL
	@table = 'PAYMENT',
	@count = @rowcount,
	@mode = 2

UPDATE #pps
	SET payment_id = ident + @first_id
	WHERE payment_id IS NULL

UPDATE PAYMENT
	SET payment_number = #pps.payment_number,
		request_status_id = #pps.request_status_id,
		requested_date = #pps.requested_date,
		requested_amount = #pps.requested_amount
	FROM #pps
		JOIN PAYMENT p ON #pps.payment_id = p.payment_id

INSERT PAYMENT
	(payment_id,
	grantee_project_id,
	payment_number,
	request_status_id,
	requested_date,
	requested_amount)
	SELECT #pps.payment_id,
		#pps.grantee_project_id,
		#pps.payment_number,
		#pps.request_status_id,
		#pps.requested_date,
		#pps.requested_amount
		FROM #pps
			LEFT JOIN PAYMENT p ON #pps.payment_id = p.payment_id
		WHERE p.payment_id IS NULL

--Do update and insert to LSC_PAYMENT
EXEC @first_id = spGETID_RANGE_SEL
	@table = 'LSC_PAYMENT',
	@count = @rowcount,
	@mode = 2

UPDATE #pps
	SET lsc_payment_id = ident + @first_id

UPDATE LSC_PAYMENT
	SET period_start = #pps.period_start
	FROM #pps
		JOIN LSC_PAYMENT lp ON #pps.lsc_payment_id = lp.lsc_payment_id

INSERT LSC_PAYMENT
	(lsc_payment_id,
	payment_id,
	period_start)
	SELECT #pps.lsc_payment_id,
		#pps.payment_id,
		#pps.period_start
		FROM #pps
			LEFT JOIN LSC_PAYMENT lp ON #pps.lsc_payment_id = lp.lsc_payment_id
		WHERE lp.lsc_payment_id IS NULL

--Do insert to LSC_MILESTONE
DELETE LSC_MILESTONE
	FROM #pps
		JOIN LSC_MILESTONE m ON #pps.payment_id = m.payment_id

IF @wf_task_id = 41 --application submission - import milestones from proposed payment schedule comment
BEGIN
	EXEC @first_id = spGETID_RANGE_SEL
		@table = 'LSC_MILESTONE',
		@count = @rowcount,
		@mode = 2

	UPDATE #pps
		SET lsc_milestone_id = ident + @first_id

	INSERT LSC_MILESTONE
		(lsc_milestone_id,	
		payment_id,
		milestone_number,
		milestone)
		SELECT lsc_milestone_id,	
			payment_id,
			1,
			milestone
			FROM #pps
			WHERE payment_number > 1
END

ELSE --@wf_task_id <> 41 - post-application task assignment - copy milestones from LSC_MILESTONE rows associated with task assignment
BEGIN

	--Create temp table of milestone data
	SELECT m.*
		INTO #m
		FROM LSC_MILESTONE m
			JOIN #pps on m.lsc_tig_proposed_payment_schedule_id = #pps.lsc_tig_proposed_payment_schedule_id

	--Set the payment_id values based on the relationship established in #PPS between proposed payment schedule ID and payment ID
	UPDATE #m
		SET payment_id = #pps.payment_id
		FROM #m
			JOIN #pps on #m.lsc_tig_proposed_payment_schedule_id = #pps.lsc_tig_proposed_payment_schedule_id

	--Generate IDs for insert into LSC_MILESTONE
	ALTER TABLE #m
		ADD ident int identity(0,1)

	SELECT @rowcount = COUNT(*)
		FROM #m

	EXEC @first_id = spGETID_RANGE_SEL
		@table = 'LSC_MILESTONE',
		@count = @rowcount,
		@mode = 2

	--Overwrite the IDs taken from existing LSC_MILESTONE rows with those reserved for the rows about to be inserted
	UPDATE #m
		SET lsc_milestone_id = ident + @first_id

	INSERT LSC_MILESTONE
		(lsc_milestone_id,	
		payment_id,
		milestone_number,
		milestone,
		instructions)
		SELECT lsc_milestone_id,	
			payment_id,
			milestone_number,
			milestone,
			instructions
			FROM #m

END

--Do insert to WF_TASK_ASSIGNMENT
SELECT @rowcount = COUNT(*)
	FROM #wfta

EXEC @first_id = spGETID_RANGE_SEL
	@table = 'WF_TASK_ASSIGNMENT',
	@count = @rowcount,
	@mode = 2

UPDATE #wfta
	SET wf_task_assignment_id = ident + @first_id
	WHERE wf_task_assignment_id IS NULL

UPDATE WF_TASK_ASSIGNMENT
	SET due_date = #wfta.due_date
	FROM #wfta
		JOIN WF_TASK_ASSIGNMENT wfta ON #wfta.wf_task_assignment_id = wfta.wf_task_assignment_id

INSERT WF_TASK_ASSIGNMENT
	(wf_task_assignment_id,
	wf_task_id,
	wf_task_status_id,
	wf_task_outcome_id,
	grantee_project_id,
	person_id,
	wf_task_role_id,
	[start_date],
	open_date,
	due_date)
	SELECT #wfta.wf_task_assignment_id,
		#wfta.wf_task_id,
		#wfta.wf_task_status_id,
		#wfta.wf_task_outcome_id,
		#wfta.grantee_project_id,
		#wfta.person_id,
		#wfta.wf_task_role_id,
		#wfta.[start_date],
		#wfta.open_date,
		#wfta.due_date
		FROM #wfta
			LEFT JOIN WF_TASK_ASSIGNMENT wfta ON #wfta.wf_task_assignment_id = wfta.wf_task_assignment_id
		WHERE wfta.wf_task_assignment_id IS NULL

--Do insert to PAYMENT_CONTINGENCY_TASKS
EXEC @first_id = spGETID_RANGE_SEL
	@table = 'PAYMENT_CONTINGENCY_TASKS',
	@count = @rowcount,
	@mode = 2

UPDATE #wfta
	SET payment_contingency_id = @first_id + ident
	WHERE payment_contingency_id IS NULL

INSERT PAYMENT_CONTINGENCY_TASKS
	(payment_contingency_id,
	payment_id,
	contingency_required_outcome_id,
	contingency_task_assignment_id,
	create_user,
	create_date)
	SELECT #wfta.payment_contingency_id,
		p.payment_id,
		61,
		#wfta.wf_task_assignment_id,
		wfta.person_id,
		getdate()
	FROM #wfta
		JOIN PAYMENT p ON #wfta.grantee_project_id = p.grantee_project_id
			AND #wfta.payment_number = p.payment_number
		JOIN WF_TASK_ASSIGNMENT wfta ON wfta.wf_task_assignment_id = @wfta_id
		LEFT JOIN PAYMENT_CONTINGENCY_TASKS pct on #wfta.payment_contingency_id = pct.payment_contingency_id
	WHERE pct.payment_contingency_id IS NULL

SELECT * FROM #pps

SELECT * FROM #wfta
