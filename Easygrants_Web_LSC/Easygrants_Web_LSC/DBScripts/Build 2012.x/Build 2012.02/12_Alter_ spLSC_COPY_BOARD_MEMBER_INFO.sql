ALTER PROCEDURE [dbo].[spLSC_COPY_BOARD_MEMBER_INFO]
	(@wf_task_assignment_id INT)

AS

DECLARE @organization_id INT,
	@time_period_id INT,
	@curr_year INT,
	@source_time_period_id INT,
	@is_nic_data BIT,
	@source_is_nic BIT,
	@wf_task_id INT


SELECT @organization_id = organization_id,
	@time_period_id = time_period_id,
	@curr_year = wfta_year,
	@wf_task_id = wf_task_id
	FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR
	WHERE wf_task_assignment_id = @wf_task_assignment_id

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
	is_nic_data bit NULL)

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
	is_nic_data)
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
		@is_nic_data
		FROM LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
		WHERE organization_id = @organization_id
			AND time_period_id = @source_time_period_id
			AND affiliation_type_id = 3
			AND is_nic_data = @source_is_nic

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
	is_nic_data)
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
		is_nic_data
		FROM #board

IF @wf_task_id <> 1 --Bring forward board chair information for applications (not used in NIC)
	EXEC spLSC_COPY_BOARD_CHAIR_INFO
		@organization_id = @organization_id,
		@time_period_id =  @time_period_id

