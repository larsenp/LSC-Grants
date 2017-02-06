--This change was implemented in production immediately after development and does not need to be executed at build time.



/****** Object:  StoredProcedure [dbo].[spLSC_COPY_STAFFING_INFO]    Script Date: 02/02/2009 14:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spLSC_COPY_STAFFING_INFO]
	(@lsc_office_id INT,
	@curr_time_period_id INT,
	@prev_time_period_id INT)

AS

DECLARE @count INT

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
	HoursPerWeek real NULL)

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
       ,HoursPerWeek)
	SELECT @lsc_office_id
		   ,sd.s_name
		   ,sd.first_name
		   ,sd.last_name
		   ,sd.lsc_staff_job_code_id
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
		FROM LSC_OFFICE o_curr
			JOIN LSC_OFFICE o_prev ON o_curr.organization_id = o_prev.organization_id
				AND o_curr.off_id = o_prev.off_id
				AND o_curr.off_type_id = o_prev.off_type_id
			JOIN LSC_STAFF_DETAIL sd ON o_prev.lsc_office_id = sd.lsc_office_id
		WHERE o_curr.lsc_office_id = @lsc_office_id
			AND o_prev.time_period_id = @prev_time_period_id

--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			
DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #staff

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_STAFF_DETAIL', @count = @rowcount, @mode = 2

UPDATE #staff 
	SET lsc_staff_detail_id = ident + @first_new_id

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
       ,HoursPerWeek)
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
	FROM #staff

