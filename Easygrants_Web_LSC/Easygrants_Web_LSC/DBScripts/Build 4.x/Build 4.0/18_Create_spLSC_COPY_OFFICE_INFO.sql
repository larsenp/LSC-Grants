CREATE PROCEDURE spLSC_COPY_OFFICE_INFO
	(@organization_id INT,
	@time_period_id INT)

AS

DECLARE @count INT

--If rows already exist for the designated organization and year, do not continue.
SELECT @count = COUNT(*) 
	FROM LSC_OFFICE
	WHERE organization_id = @organization_id
		AND time_period_id  = @time_period_id 

IF @count > 0
	RETURN

DECLARE @curr_comp_year INT, --year corresponding to the @time_period_id parameter passed in
	@prev_time_period_id INT --time period ID corresponding to the previous year (used to obtain office data)

SELECT @curr_comp_year = sort_order
	FROM c_TIME_PERIOD
	WHERE id = @time_period_id

SELECT @prev_time_period_id = id
	FROM c_TIME_PERIOD
	WHERE sort_order = @curr_comp_year - 1

--Create temp table for insert
CREATE TABLE #off(
	ident int identity(0,1) NOT NULL,
	lsc_office_id int NULL,
	organization_id int NULL,
	time_period_id int NULL,
	off_id varchar(2) NULL,
	off_Type_id int NULL,
	off_name varchar(50) NULL,
	addr1_off varchar(50) NULL,
	addr2_off varchar(50) NULL,
	city_off varchar(50) NULL,
	state_province_id_off int NULL,
	zip_off varchar(50) NULL,
	phone varchar(50) NULL,
	fax varchar(50) NULL,
	email varchar(50) NULL,
	person_incharge varchar(50) NULL,
	num_staff smallint NULL,
	SubRecipReport bit NOT NULL,
	Note1 varchar(75) NULL,
	WorkWeek real NULL)

--Populate temp table with previous year's data
INSERT #off
	(organization_id
	,time_period_id
	,off_id
	,off_Type_id
	,off_name
	,addr1_off
	,addr2_off
	,city_off
	,state_province_id_off
	,zip_off
	,phone
	,fax
	,email
	,person_incharge
	,num_staff
	,SubRecipReport
	,Note1
	,WorkWeek)
	SELECT organization_id
		,@time_period_id --substitute time_period_id for current year
		,off_id
		,off_Type_id
		,off_name
		,addr1_off
		,addr2_off
		,city_off
		,state_province_id_off
		,zip_off
		,phone
		,fax
		,email
		,person_incharge
		,num_staff
		,SubRecipReport
		,Note1
		,WorkWeek
		FROM LSC_OFFICE o
		WHERE organization_id = @organization_id
			AND time_period_id = @prev_time_period_id

--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			
DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #off

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_OFFICE', @count = @rowcount, @mode = 2

UPDATE #off 
	SET lsc_office_id = ident + @first_new_id

INSERT LSC_OFFICE
	(lsc_office_id
	,organization_id
	,time_period_id
	,off_id
	,off_Type_id
	,off_name
	,addr1_off
	,addr2_off
	,city_off
	,state_province_id_off
	,zip_off
	,phone
	,fax
	,email
	,person_incharge
	,num_staff
	,SubRecipReport
	,Note1
	,WorkWeek)
	SELECT lsc_office_id
	,organization_id
	,time_period_id
	,off_id
	,off_Type_id
	,off_name
	,addr1_off
	,addr2_off
	,city_off
	,state_province_id_off
	,zip_off
	,phone
	,fax
	,email
	,person_incharge
	,num_staff
	,SubRecipReport
	,Note1
	,WorkWeek
	FROM #off

DECLARE @lo_id INT

DECLARE offices CURSOR FOR
	SELECT lsc_office_id 
		FROM #off

OPEN offices

FETCH NEXT FROM offices INTO @lo_id

WHILE (@@FETCH_STATUS=0)
	BEGIN
		EXEC spLSC_COPY_STAFFING_INFO
			@lsc_office_id = @lo_id,
			@curr_time_period_id = @time_period_id,
			@prev_time_period_id = @prev_time_period_id

		FETCH NEXT FROM offices INTO @lo_id
	END

CLOSE offices
DEALLOCATE offices

