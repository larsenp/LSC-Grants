ALTER PROCEDURE [dbo].[spLSC_COPY_OFFICE_INFO]
    (@organization_id INT,
    @time_period_id INT)

AS

DECLARE @count INT
	,@cutoff_date datetime

--If rows already exist for the designated organization and year, do not continue.
SELECT @count = COUNT(*) 
    FROM LSC_OFFICE
    WHERE organization_id = @organization_id
        AND time_period_id = @time_period_id 

IF @count > 0
    RETURN

DECLARE @curr_comp_year INT, --year corresponding to the @time_period_id parameter passed in
    @prev_time_period_id INT, --time period ID corresponding to the previous year (used to obtain office data)
    @recipient_id INT --recipient ID for use in pulling information from the program directory

SELECT @curr_comp_year = sort_order
    FROM c_TIME_PERIOD
    WHERE id = @time_period_id

SELECT @prev_time_period_id = id
    FROM c_TIME_PERIOD
    WHERE sort_order = @curr_comp_year - 1

SELECT @recipient_id = legacy_organization_id
    FROM ORGANIZATION
    WHERE organization_id = @organization_id

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
    SubRecipReport bit NULL,
    Note1 varchar(75) NULL,
    WorkWeek real NULL,
    open_date datetime NULL,
    close_date datetime NULL)

--Populate temp table subgrant office info from previous year's form
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
    ,WorkWeek
    ,open_date
    ,close_date)
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
        ,WorkWeek
        ,open_date
        ,close_date
        FROM LSC_OFFICE o
        WHERE organization_id = @organization_id
            AND time_period_id = @prev_time_period_id
            AND off_Type_id = 3

--Populate main office info from Program Directory
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
    ,WorkWeek)
    SELECT @organization_id
        ,@time_period_id
        ,'00'
        ,1
        ,NULL
        ,r.Addr1_Off
        ,r.Addr2_Off
        ,r.City_Off
        ,sp.id
        ,r.Zip_Off
        ,r.Phone 
        ,r.Fax 
        ,r.EMail
        ,NULL
        ,NULL
        FROM [LSC-SQL].rindb.dbo.Rmaster r
            JOIN c_STATE_PROV sp ON r.State_Off = sp.abbr
        WHERE r.Org_ID = @recipient_id

--Update fields not managed in Program Directory
UPDATE #off
    SET off_name = o.off_name
        ,person_incharge = o.person_incharge
        ,WorkWeek = o.WorkWeek
    FROM #off
        JOIN LSC_OFFICE o ON #off.organization_id = o.organization_id
            AND #off.off_id = o.off_id
            AND o.time_period_id = @prev_time_period_id
    WHERE #off.off_id = '00'

--Populate branch office info from Program Directory
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
    ,open_date
    ,close_date)
    SELECT @organization_id
        ,@time_period_id
        ,off_id
        ,2
        ,off_name
        ,addr1_off
        ,addr2_off
        ,city_off
		,sp.id
        ,zip_off
        ,phone
        ,fax
        ,email
        ,person_incharge
        ,open_date
        ,close_date
    FROM [LSC-SQL].rindb.dbo.tbl_Offices_PD
		JOIN [LSC-SQL].rindb.dbo.tblx_State s on state_id = s.id
		JOIN c_STATE_PROV sp ON s.item = sp.abbr
		WHERE OrgID = @recipient_id

--Update work week, which is not managed in Program Directory
UPDATE #off
    SET WorkWeek = o.WorkWeek
    FROM #off
        JOIN LSC_OFFICE o ON #off.organization_id = o.organization_id
            AND #off.off_id = o.off_id
            AND o.time_period_id = @prev_time_period_id
    WHERE #off.off_type_id = 2

--Get IDs from the ID generation table and set in temp table. 
--This will allow creation of foreign keys for staff rows and insertion of office rows into the LSC Grants data table. 
DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #off

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_OFFICE', @count = @rowcount, @mode = 2

UPDATE #off 
    SET lsc_office_id = ident + @first_new_id

--Get staffing information for all offices in temp table.
--Set cutoff date for deletion of staffing records with termination dates
SELECT @cutoff_date = CAST('1-Jan-' + CAST(sort_order AS VARCHAR(4)) AS DATETIME)
	FROM c_time_period
	WHERE id = @time_period_id


--Create temp table for insert
CREATE TABLE #staff(
	ident int identity(0,1) NOT NULL,
	lsc_staff_detail_id int NULL,
	lsc_office_id int NULL,
	s_name varchar(50) NULL,
	first_name varchar(20) NULL,
	last_name varchar(50) NULL,
	lsc_staff_job_code_id int NULL,
	attorney bit NULL,
	ethnicity_id int NULL,
	age_40_plus bit NULL,
	gender_id int NULL,
	lsc_lang_code_id int NULL,
	[disabled] bit NULL,
	start_dte datetime NULL,
	yrs_exp_curr smallint NULL,
	yrs_exp_w_lsc smallint NULL,
	yrs_exp_prof smallint NULL,
	termination datetime NULL,
	annl_salary int NULL,
	serv_area_1 varchar(50) NULL,
	pct_time_1 smallint NULL,
	serv_area_2 varchar(50) NULL,
	pct_time_2 smallint NULL,
	serv_area_3 varchar(50) NULL,
	pct_time_3 smallint NULL,
	serv_area_4 varchar(50) NULL,
	pct_time_4 smallint NULL,
	serv_area_5 varchar(50) NULL,
	pct_time_5 smallint NULL,
	filler varchar(30) NULL,
	SubRecipReport bit NULL,
	Start_Dte1 datetime NULL,
	Note varchar(100) NULL,
	HoursPerWeek real NULL,
	email_addr varchar(100) null)

--Populate temp table with previous year's data
INSERT #staff
	(lsc_office_id
       ,s_name
       ,first_name
       ,last_name
       ,lsc_staff_job_code_id
       ,attorney
       ,ethnicity_id
       ,age_40_plus
       ,gender_id
       ,lsc_lang_code_id
       ,[disabled]
       ,start_dte
       ,yrs_exp_curr
       ,yrs_exp_w_lsc
       ,yrs_exp_prof
       ,termination
       ,annl_salary
       ,serv_area_1
       ,pct_time_1
       ,serv_area_2
       ,pct_time_2
       ,serv_area_3
       ,pct_time_3
       ,serv_area_4
       ,pct_time_4
       ,serv_area_5
       ,pct_time_5
       ,filler
       ,SubRecipReport
       ,Start_Dte1
       ,Note
       ,HoursPerWeek
		,email_addr)
	SELECT #off.lsc_office_id
		   ,sd.s_name
		   ,sd.first_name
		   ,sd.last_name
           ,case when sd.lsc_staff_job_code_id = 23 then 99 else sd.lsc_staff_job_code_id end lsc_staff_job_code_id
		   ,sd.attorney
		   ,sd.ethnicity_id
		   ,sd.age_40_plus
		   ,sd.gender_id
		   ,sd.lsc_lang_code_id
		   ,sd.[disabled]
		   ,sd.start_dte
		   ,sd.yrs_exp_curr + 1
		   ,sd.yrs_exp_w_lsc + 1
		   ,sd.yrs_exp_prof + 1
		   ,sd.termination
		   ,sd.annl_salary
		   ,sd.serv_area_1
		   ,sd.pct_time_1
		   ,sd.serv_area_2
		   ,sd.pct_time_2
		   ,sd.serv_area_3
		   ,sd.pct_time_3
		   ,sd.serv_area_4
		   ,sd.pct_time_4
		   ,sd.serv_area_5
		   ,sd.pct_time_5
		   ,sd.filler
		   ,sd.SubRecipReport
		   ,sd.Start_Dte1
		   ,sd.Note
		   ,sd.HoursPerWeek
			,sd.email_addr
		FROM #off
			JOIN LSC_OFFICE o_prev ON #off.organization_id = o_prev.organization_id
				AND #off.off_id = o_prev.off_id
				AND #off.off_type_id = o_prev.off_type_id
			JOIN LSC_STAFF_DETAIL sd ON o_prev.lsc_office_id = sd.lsc_office_id
		WHERE o_prev.time_period_id = @prev_time_period_id
			AND (sd.termination IS NULL OR sd.termination >= @cutoff_date)

--Update language codes to reflect changes for 2013
-- --1. Match on abbr column (new language name associated with existing code)
UPDATE #staff
	SET lsc_lang_code_id = lc_new.id
	FROM #staff
		JOIN LSC_c_LANG_CODE lc_old ON #staff.lsc_lang_code_id = lc_old.id
		JOIN LSC_c_LANG_CODE lc_new ON lc_old.abbr = lc_new.abbr
			AND (lc_new.end_date IS NULL OR lc_new.end_date > getdate())
	WHERE lc_old.end_date < getdate()

-- --2. Use successor_id (old language discontinued, lumped into new group)
UPDATE #staff
	SET lsc_lang_code_id = lc.successor_id
	FROM #staff
		JOIN LSC_c_LANG_CODE lc ON #staff.lsc_lang_code_id = lc.id
	WHERE lc.end_date < getdate()
		AND lc.successor_id IS NOT NULL


--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			
SELECT @rowcount = count(*) FROM #staff

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_STAFF_DETAIL', @count = @rowcount, @mode = 2

UPDATE #staff 
	SET lsc_staff_detail_id = ident + @first_new_id

--Insert office rows into LSC Grants
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
    ,WorkWeek
    ,open_date
    ,close_date)
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
    ,open_date
    ,close_date
    FROM #off

--Insert staffing rows into LSC Grants
INSERT LSC_STAFF_DETAIL
	(lsc_staff_detail_id
		,lsc_office_id
       ,s_name
       ,first_name
       ,last_name
       ,lsc_staff_job_code_id
       ,attorney
       ,ethnicity_id
       ,age_40_plus
       ,gender_id
       ,lsc_lang_code_id
       ,[disabled]
       ,start_dte
       ,yrs_exp_curr
       ,yrs_exp_w_lsc
       ,yrs_exp_prof
       ,termination
       ,annl_salary
       ,serv_area_1
       ,pct_time_1
       ,serv_area_2
       ,pct_time_2
       ,serv_area_3
       ,pct_time_3
       ,serv_area_4
       ,pct_time_4
       ,serv_area_5
       ,pct_time_5
       ,filler
       ,SubRecipReport
       ,Start_Dte1
       ,Note
       ,HoursPerWeek
		,email_addr)
	SELECT lsc_staff_detail_id
		,lsc_office_id
       ,s_name
       ,first_name
       ,last_name
       ,lsc_staff_job_code_id
       ,attorney
       ,ethnicity_id
       ,age_40_plus
       ,gender_id
       ,lsc_lang_code_id
       ,[disabled]
       ,start_dte
       ,yrs_exp_curr
       ,yrs_exp_w_lsc
       ,yrs_exp_prof
       ,termination
       ,annl_salary
       ,serv_area_1
       ,pct_time_1
       ,serv_area_2
       ,pct_time_2
       ,serv_area_3
       ,pct_time_3
       ,serv_area_4
       ,pct_time_4
       ,serv_area_5
       ,pct_time_5
       ,filler
       ,SubRecipReport
       ,Start_Dte1
       ,Note
       ,HoursPerWeek
		,email_addr
	FROM #staff
