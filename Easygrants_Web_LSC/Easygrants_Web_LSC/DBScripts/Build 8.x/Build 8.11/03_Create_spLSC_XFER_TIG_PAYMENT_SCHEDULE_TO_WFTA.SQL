/****** Object:  StoredProcedure [dbo].[spLSC_XFER_TIG_PAYMENT_SCHEDULE_TO_WFTA]    Script Date: 09/01/2010 13:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLSC_XFER_TIG_PAYMENT_SCHEDULE_TO_WFTA]
	@WfTaskAssignmentID INT --task assignment to which payment schedule info will be written.

AS

--Create temp table to hold schedule data
CREATE TABLE #ps
	(ident int identity(0,1),
	[lsc_tig_proposed_payment_schedule_id] [int] NULL,
	[wf_task_assignment_id] [int] NULL,
	[payment_number] [int] NULL,
	[payment_date] [datetime] NULL,
	[payment_amount] [int] NULL,
	payment_id int null)

--Create temp table to hold milestone data
CREATE TABLE #m(
	ident int identity(0,1),
	[lsc_milestone_id] [int] NULL,
	payment_id int NULL,
	[milestone_number] [int] NULL,
	[milestone] [varchar](max) NULL,
	[instructions] [varchar](max) NULL,
	[report] [varchar](max) NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
	[lsc_tig_proposed_payment_schedule_id] [int] NULL)

--Get grantee project ID
DECLARE @grantee_project_id INT

SELECT @grantee_project_id = grantee_project_id
	FROM WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @WfTaskAssignmentID

--Insert schedule data into temp table
INSERT #ps
	(wf_task_assignment_id,
	payment_number,
	payment_date,
	payment_amount,
	payment_id)
	SELECT @WfTaskAssignmentID,
		p.payment_number,
		p.requested_date,
		p.requested_amount,
		p.payment_id
		FROM PAYMENT p
			LEFT JOIN LSC_MILESTONE m ON p.payment_id = m.payment_id
				AND m.milestone_number = 1
		WHERE p.grantee_project_id = @grantee_project_id

--Set IDs for schedule data
DECLARE @first_id int, @rowcount int

SELECT @rowcount = COUNT(*) FROM #ps

EXEC @first_id = spGETID_RANGE_SEL
	@table='LSC_TIG_PROPOSED_PAYMENT_SCHEDULE',
	@count = @rowcount,
	@mode = 2

UPDATE #ps
	SET lsc_tig_proposed_payment_schedule_id = ident + @first_id

--Insert milestone data into temp table
INSERT #m(
	[milestone_number] ,
	[milestone] ,
	[instructions] ,
	[report] ,
	[create_user] ,
	[create_date] ,
	[modify_user] ,
	[modify_date],
	lsc_tig_proposed_payment_schedule_id)
	SELECT m.[milestone_number] ,
		m.[milestone] ,
		m.[instructions] ,
		m.[report] ,
		m.[create_user] ,
		m.[create_date] ,
		m.[modify_user] ,
		m.[modify_date],
		#ps.lsc_tig_proposed_payment_schedule_id
		FROM LSC_MILESTONE m
			JOIN #ps ON m.payment_id = #ps.payment_id

--Set IDs for milestone data
SELECT @rowcount = COUNT(*) FROM #m

EXEC @first_id = spGETID_RANGE_SEL
	@table='LSC_MILESTONE',
	@count = @rowcount,
	@mode = 2

UPDATE #m
	SET lsc_milestone_id = ident + @first_id

--Delete existing milestones
DELETE LSC_MILESTONE
	FROM LSC_TIG_PROPOSED_PAYMENT_SCHEDULE pps
		JOIN LSC_MILESTONE m ON pps.lsc_tig_proposed_payment_schedule_id = m.lsc_tig_proposed_payment_schedule_id
	WHERE pps.wf_task_assignment_id = @WfTaskAssignmentID

--Delete existing schedule data
DELETE LSC_TIG_PROPOSED_PAYMENT_SCHEDULE 
	WHERE wf_task_assignment_id = @WfTaskAssignmentID

--Insert schedule data into database
INSERT LSC_TIG_PROPOSED_PAYMENT_SCHEDULE
           (lsc_tig_proposed_payment_schedule_id
           ,wf_task_assignment_id
           ,payment_number
           ,payment_date
           ,payment_amount)
     SELECT 
           lsc_tig_proposed_payment_schedule_id
           ,wf_task_assignment_id
           ,payment_number
           ,payment_date
           ,payment_amount
		FROM #ps

--Insert milestone data into database
INSERT LSC_MILESTONE
	(lsc_milestone_id,
	[milestone_number] ,
	[milestone] ,
	[instructions] ,
	[report] ,
	[create_user] ,
	[create_date] ,
	[modify_user] ,
	[modify_date],
	lsc_tig_proposed_payment_schedule_id)
	SELECT lsc_milestone_id,
		[milestone_number] ,
		[milestone] ,
		[instructions] ,
		[report] ,
		[create_user] ,
		[create_date] ,
		[modify_user] ,
		[modify_date],
		lsc_tig_proposed_payment_schedule_id
	FROM #m

SELECT * FROM #ps
SELECT * FROM #m