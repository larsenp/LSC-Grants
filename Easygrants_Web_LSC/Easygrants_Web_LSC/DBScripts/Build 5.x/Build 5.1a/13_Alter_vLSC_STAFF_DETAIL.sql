/****** Object:  View [dbo].[vLSC_STAFF_DETAIL]    Script Date: 04/23/2009 11:28:03 ******/
/*
Include left joins to code tables to account for cases where demographic info (e.g., ethnicity, gender)
was not provided.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_STAFF_DETAIL]

AS

SELECT org.legacy_organization_id recipient_id,
	tp.sort_order [year],
	o.off_id,
	o.off_type_id,
	o.off_name,
	sd.lsc_staff_detail_id,
	sd.lsc_office_id,
	sd.s_name,
	sd.first_name,
	sd.last_name,
	sd.first_name + ' ' + sd.last_name first_last,
	sd.last_name + ', ' + sd.first_name last_first,
	sd.lsc_staff_job_code_id,
	jc.description job_description,
	sd.attorney,
	sd.ethnicity_id,
	e.sort_order ethnic_code,
	e.description ethnicity,
	sd.age_40_plus,
	sd.gender_id,
	substring(g.abbr, 1, 1) gender,
	sd.lsc_lang_code_id,
	lc.description [language],
	sd.disabled,
	sd.start_dte,
	sd.yrs_exp_curr,
	sd.yrs_exp_w_lsc,
	sd.yrs_exp_prof,
	sd.termination,
	sd.annl_salary,
	sdt.pct_full_time,
	sd.serv_area_1,
	sd.pct_time_1,
	sd.serv_area_2,
	sd.pct_time_2,
	sd.serv_area_3,
	sd.pct_time_3,
	sd.serv_area_4,
	sd.pct_time_4,
	sd.serv_area_5,
	sd.pct_time_5,
	sd.filler,
	sd.SubRecipReport,
	sd.Start_Dte1,
	sd.Note,
	sd.HoursPerWeek
	FROM LSC_STAFF_DETAIL sd
		LEFT JOIN LSC_c_JOB_CLASS jc ON sd.lsc_staff_job_code_id = jc.id
		LEFT JOIN c_ETHNICITY e ON sd.ethnicity_id = e.id
		LEFT JOIN c_GENDER g ON sd.gender_id = g.id
		LEFT JOIN LSC_c_LANG_CODE lc ON sd.lsc_lang_code_id = lc.id
		JOIN LSC_OFFICE o ON sd.lsc_office_id = o.lsc_office_id
		JOIN ORGANIZATION org ON o.organization_id = org.organization_id
		JOIN c_TIME_PERIOD tp ON o.time_period_id = tp.id
		JOIN vLSC_STAFF_DETAIL_TOTALS sdt ON sd.lsc_staff_detail_id = sdt.lsc_staff_detail_id
