ALTER PROCEDURE [dbo].[spLSC_COPY_BOARD_STRUCTURE_INFO]
	(@wf_task_assignment_id INT)

AS

DECLARE @organization_id INT,
	@time_period_id INT,
	@curr_year INT,
	@source_time_period_id INT,
	@is_nic_data BIT,
	@source_is_nic BIT,
	@wf_task_id INT,
	@nanb BIT

SELECT @organization_id = organization_id,
	@time_period_id = time_period_id,
	@curr_year = wfta_year,
	@wf_task_id = wf_task_id
	FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR
	WHERE wf_task_assignment_id = @wf_task_assignment_id

SET @nanb = 0

IF @wf_task_id = 1 --NIC: take data from previous year's application
BEGIN
	SELECT @source_time_period_id = id
		FROM c_TIME_PERIOD
		WHERE sort_order = @curr_year - 1

	SET @is_nic_data = 1
	SET @source_is_nic = 0
END

IF @wf_task_id IN (2,66) --Competitive application: take data from this year's NIC
BEGIN
	SET @source_time_period_id = @time_period_id

	SET @is_nic_data = 0
	SET @source_is_nic = 1

	IF @wf_task_id = 2
		SELECT @nanb = new_applicant_no_board
			FROM LSC_BOARD_STRUCTURE
			WHERE organization_id = @organization_id
				AND time_period_id = @source_time_period_id
				AND is_nic_data = @source_is_nic

END

IF @wf_task_id IN (4,67) --Renewal application: take data from last year's application
BEGIN
	SELECT @source_time_period_id = id
		FROM c_TIME_PERIOD
		WHERE sort_order = @curr_year - 1

	SET @is_nic_data = 0
	SET @source_is_nic = 0
END

CREATE TABLE #board
	(ident int identity(0,1),
	lsc_board_structure_id int NULL,
	mccollum_atty_bylaw int NULL,
	other_atty_bylaw int NULL,
	client_member_bylaw int NULL,
	other_member_bylaw int NULL,
	organization_id INT NULL,
	time_period_id INT NULL,
	is_nic_data BIT NULL)

INSERT #board
	(mccollum_atty_bylaw ,
	other_atty_bylaw ,
	client_member_bylaw ,
	other_member_bylaw ,
	organization_id ,
	time_period_id,
	is_nic_data)
	SELECT mccollum_atty_bylaw ,
		other_atty_bylaw ,
		client_member_bylaw ,
		other_member_bylaw ,
		@organization_id ,
		@time_period_id,
		@is_nic_data
		FROM LSC_BOARD_STRUCTURE
		WHERE organization_id = @organization_id
			AND time_period_id = @source_time_period_id
			AND is_nic_data = @source_is_nic

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
	is_nic_data)
	SELECT lsc_board_structure_id,
		mccollum_atty_bylaw,
		other_atty_bylaw,
		client_member_bylaw,
		other_member_bylaw,
		organization_id ,
		time_period_id,
		is_nic_data
		FROM #board

IF @wf_task_id <> 1 --Bring forward board chair information for applications (not used in NIC)
	EXEC spLSC_COPY_BOARD_CHAIR_INFO
		@organization_id = @organization_id,
		@time_period_id =  @time_period_id

