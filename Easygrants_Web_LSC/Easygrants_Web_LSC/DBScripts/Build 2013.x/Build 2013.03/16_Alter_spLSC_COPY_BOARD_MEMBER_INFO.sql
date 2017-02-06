/****** Object:  StoredProcedure [dbo].[spLSC_COPY_BOARD_MEMBER_INFO]    Script Date: 02/14/2013 09:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spLSC_COPY_BOARD_MEMBER_INFO]
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
	@has_1607 BIT


SELECT @organization_id = organization_id,
	@time_period_id = time_period_id,
	@curr_year = wfta_year,
	@wf_task_id = wf_task_id
	FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR
	WHERE wf_task_assignment_id = @wf_task_assignment_id

SELECT @prev_time_period_id = id
	FROM c_TIME_PERIOD
	WHERE sort_order = @curr_year - 1

--Determine whether there is a 1607 reporting task for this grantee in the previous cycle
IF EXISTS 
	(SELECT * FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR
		WHERE wf_task_id = 89
			AND organization_id = @organization_id
			AND time_period_id = @prev_time_period_id
			AND wf_task_status_id <> 3)

	SET @has_1607 = 1

ELSE
	SET @has_1607 = 0

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

IF @wf_task_id = 89 --1607 report: take data from previous year's application (same cycle as 1607 report task assignment)
BEGIN
	SET @source_time_period_id = @time_period_id
	SET @target_board_info_source_id = 3
	SET @source_board_info_source_id = 1
END

--If board info already exists for current submission, do not bring forward from previous submission.
IF EXISTS
	(SELECT * FROM LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
		WHERE organization_id = @organization_id
			AND time_period_id = @time_period_id
			AND lsc_board_info_source_id = @target_board_info_source_id
			AND affiliation_type_id = 3)
	RETURN

CREATE TABLE #board
	(ident int identity(0,1),
	id int NULL,
	organization_id INT NULL,
	time_period_id INT NULL,
	affiliation_type_id int NULL,
	role_id int NULL,
	name_prefix_id int NULL,
	name_first varchar(100) NULL,
	name_last varchar(100) NULL,
	name_middle varchar(50) NULL,
	name_suffix_id int NULL,
	email_address varchar(100) NULL,
	title varchar(100) NULL,
	relevant_experience varchar(max) NULL,
	status_id int NULL,
	appointing_organization varchar(50) NULL,
	gender_id int NULL,
	ethnicity_id int NULL,
	address varchar(100) NULL,
	city varchar(50) NULL,
	state_province_id int NULL,
	zip_postal_code varchar(30) NULL,
	phone varchar(50) NULL,
	address_phone_type_id int NULL,
	board_member_type_id int NULL,
	create_user int NULL,
	create_date datetime NULL,
	modify_user int NULL,
	modify_date datetime NULL,
	lsc_board_info_source_id int NULL)

INSERT #board
	(organization_id,
	time_period_id,
	affiliation_type_id ,
	role_id ,
	name_prefix_id ,
	name_first ,
	name_last ,
	name_middle ,
	name_suffix_id ,
	email_address ,
	title ,
	relevant_experience ,
	status_id ,
	appointing_organization ,
	gender_id ,
	ethnicity_id ,
	address ,
	city ,
	state_province_id ,
	zip_postal_code ,
	phone ,
	address_phone_type_id ,
	board_member_type_id ,
	create_user ,
	create_date ,
	modify_user ,
	modify_date,
	lsc_board_info_source_id)
	SELECT 	@organization_id,
		@time_period_id,
		affiliation_type_id ,
		role_id ,
		name_prefix_id ,
		name_first ,
		name_last ,
		name_middle ,
		name_suffix_id ,
		email_address ,
		title ,
		relevant_experience ,
		status_id ,
		appointing_organization ,
		gender_id ,
		ethnicity_id ,
		address ,
		city ,
		state_province_id ,
		zip_postal_code ,
		phone ,
		address_phone_type_id ,
		board_member_type_id ,
		create_user ,
		create_date ,
		modify_user ,
		modify_date,
		@target_board_info_source_id
		FROM LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
		WHERE organization_id = @organization_id
			AND time_period_id = @source_time_period_id
			AND affiliation_type_id = 3
			AND lsc_board_info_source_id = @source_board_info_source_id

--Remove invalid ethnicity codes
UPDATE #board
	SET ethnicity_id = NULL
	FROM #board b
		JOIN c_ETHNICITY e ON b.ethnicity_id = e.id
	WHERE e.end_date is not null

--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			
DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #board

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS', @count = @rowcount, @mode = 2

UPDATE #board
	SET id = ident + @first_new_id

--Insert rows into database
INSERT LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
	(id,
	organization_id ,
	time_period_id ,
	affiliation_type_id ,
	role_id ,
	name_prefix_id ,
	name_first ,
	name_last ,
	name_middle ,
	name_suffix_id ,
	email_address ,
	title ,
	relevant_experience ,
	status_id ,
	appointing_organization ,
	gender_id ,
	ethnicity_id ,
	address ,
	city ,
	state_province_id ,
	zip_postal_code ,
	phone ,
	address_phone_type_id ,
	board_member_type_id ,
	create_user ,
	create_date ,
	modify_user ,
	modify_date,
	lsc_board_info_source_id)
	SELECT id,
		organization_id ,
		time_period_id ,
		affiliation_type_id ,
		role_id ,
		name_prefix_id ,
		name_first ,
		name_last ,
		name_middle ,
		name_suffix_id ,
		email_address ,
		title ,
		relevant_experience ,
		status_id ,
		appointing_organization ,
		gender_id ,
		ethnicity_id ,
		address ,
		city ,
		state_province_id ,
		zip_postal_code ,
		phone ,
		address_phone_type_id ,
		board_member_type_id ,
		create_user ,
		create_date ,
		modify_user ,
		modify_date,
		lsc_board_info_source_id
		FROM #board

IF @wf_task_id <> 1 --Bring forward board chair information for applications (not used in NIC)
	EXEC spLSC_COPY_BOARD_CHAIR_INFO
		@organization_id = @organization_id,
		@time_period_id =  @time_period_id,
		@lsc_board_info_source_id = @target_board_info_source_id
