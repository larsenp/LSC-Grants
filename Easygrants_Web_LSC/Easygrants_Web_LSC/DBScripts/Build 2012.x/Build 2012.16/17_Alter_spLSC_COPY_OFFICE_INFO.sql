ALTER PROCEDURE [dbo].[spLSC_COPY_OFFICE_INFO]
    (@organization_id INT,
    @time_period_id INT)

AS

DECLARE @count INT

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
        ,state_id
        ,zip_off
        ,phone
        ,fax
        ,email
        ,person_incharge
        ,open_date
        ,close_date
    FROM [LSC-SQL].rindb.dbo.tbl_Offices_PD
		WHERE OrgID = @recipient_id

--Update work week, which is not managed in Program Directory
UPDATE #off
    SET WorkWeek = o.WorkWeek
    FROM #off
        JOIN LSC_OFFICE o ON #off.organization_id = o.organization_id
            AND #off.off_id = o.off_id
            AND o.time_period_id = @prev_time_period_id
    WHERE #off.off_type_id = 2

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