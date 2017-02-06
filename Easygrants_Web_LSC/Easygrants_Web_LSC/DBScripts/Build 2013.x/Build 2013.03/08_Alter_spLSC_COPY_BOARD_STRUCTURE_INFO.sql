/****** Object:  StoredProcedure [dbo].[spLSC_COPY_BOARD_STRUCTURE_INFO]    Script Date: 01/31/2013 09:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spLSC_COPY_BOARD_STRUCTURE_INFO]
	(@wf_task_assignment_id INT)

AS

DECLARE @organization_id INT,
	@time_period_id INT,
	@prev_time_period_id INT,
	@curr_year INT,
	@source_time_period_id INT,
	@source_board_info_source_id INT, --source ID of data to be copied (1607, NIC, application)
	@target_board_info_source_id INT, --source ID to be written into target data
	@wf_task_id INT,
	@nanb BIT,
	@has_1607 BIT

--Determine whether there is a 1607 reporting task for this grantee in the previous cycle
SELECT @organization_id = organization_id,
	@time_period_id = time_period_id,
	@curr_year = wfta_year,
	@wf_task_id = wf_task_id
	FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR
	WHERE wf_task_assignment_id = @wf_task_assignment_id

SELECT @prev_time_period_id = id
	FROM c_TIME_PERIOD
	WHERE sort_order = @curr_year - 1

IF EXISTS 
	(SELECT * FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR
		WHERE wf_task_id = 89
			AND organization_id = @organization_id
			AND wfta_year = @curr_year - 1
			AND wf_task_status_id <> 3)

	SET @has_1607 = 1

ELSE
	SET @has_1607 = 0

SET @nanb = 0

IF @wf_task_id = 1 --NIC: take data from 1607 report if it exists, otherwise from previous year's application
BEGIN
	SET @source_time_period_id = @prev_time_period_id
	SET @target_board_info_source_id = 2

	IF @has_1607 = 1
		SET @source_board_info_source_id = 3
	ELSE
		SET @source_board_info_source_id = 1
END

IF @wf_task_id IN (2,66) --Competitive application: take data from this year's NIC
BEGIN
	SET @source_time_period_id = @time_period_id

	SET @target_board_info_source_id = 1
	SET @source_board_info_source_id = 2

	IF @wf_task_id = 2
		SELECT @nanb = new_applicant_no_board
			FROM LSC_BOARD_STRUCTURE
			WHERE organization_id = @organization_id
				AND time_period_id = @source_time_period_id
				AND is_nic_data = @source_board_info_source_id

END

IF @wf_task_id IN (4,67) --Renewal application: take data from 1607 report if it exists, otherwise from last year's application
BEGIN
	SET @source_time_period_id = @prev_time_period_id
	SET @target_board_info_source_id = 1
 	IF @has_1607 = 1
		SET @source_board_info_source_id = 3
	ELSE
		SET @source_board_info_source_id = 1
END

IF @wf_task_id = 89 --1607 report: take data from previous year's application
BEGIN
	SET @source_time_period_id = @time_period_id
	SET @target_board_info_source_id = 3
	SET @source_board_info_source_id = 1
END

--If board info already exists for current submission, do not bring forward from previous submission.
IF EXISTS
	(SELECT * FROM LSC_BOARD_STRUCTURE
		WHERE organization_id = @organization_id
			AND time_period_id = @time_period_id
			AND lsc_board_info_source_id = @target_board_info_source_id)
	RETURN

CREATE TABLE #board
	(ident int identity(0,1),
	lsc_board_structure_id int NULL,
	mccollum_atty_bylaw int NULL,
	other_atty_bylaw int NULL,
	client_member_bylaw int NULL,
	other_member_bylaw int NULL,
	organization_id INT NULL,
	time_period_id INT NULL,
	lsc_board_info_source_id INT NULL)

INSERT #board
	(mccollum_atty_bylaw ,
	other_atty_bylaw ,
	client_member_bylaw ,
	other_member_bylaw ,
	organization_id ,
	time_period_id,
	lsc_board_info_source_id)
	SELECT mccollum_atty_bylaw ,
		other_atty_bylaw ,
		client_member_bylaw ,
		other_member_bylaw ,
		@organization_id ,
		@time_period_id,
		@target_board_info_source_id
		FROM LSC_BOARD_STRUCTURE
		WHERE organization_id = @organization_id
			AND time_period_id = @source_time_period_id
			AND lsc_board_info_source_id = @source_board_info_source_id

--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			
DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #board

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_BOARD_STRUCTURE', @count = @rowcount, @mode = 2

UPDATE #board
	SET lsc_board_structure_id = ident + @first_new_id

INSERT LSC_BOARD_STRUCTURE
	(lsc_board_structure_id,
	mccollum_atty_bylaw,
	other_atty_bylaw,
	client_member_bylaw,
	other_member_bylaw,
	organization_id ,
	time_period_id,
	lsc_board_info_source_id)
	SELECT lsc_board_structure_id,
		mccollum_atty_bylaw,
		other_atty_bylaw,
		client_member_bylaw,
		other_member_bylaw,
		organization_id ,
		time_period_id,
		lsc_board_info_source_id
		FROM #board

IF @wf_task_id <> 1 --Bring forward board chair information for applications and 1607 reports (not used in NIC)
	EXEC spLSC_COPY_BOARD_CHAIR_INFO
		@organization_id = @organization_id,
		@time_period_id =  @time_period_id,
		@lsc_board_info_source_id = @target_board_info_source_id
