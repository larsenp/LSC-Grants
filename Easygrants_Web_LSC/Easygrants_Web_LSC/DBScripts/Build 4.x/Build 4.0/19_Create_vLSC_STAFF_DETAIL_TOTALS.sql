CREATE VIEW vLSC_STAFF_DETAIL_TOTALS 

AS

SELECT lsd.lsc_staff_detail_id,
	last_name + ', ' + first_name last_first,
	CASE WHEN attorney = 1 THEN 'Y' ELSE 'N' END AS attorney_yn,
	CASE WHEN age_40_plus = 1 THEN 'Y' ELSE 'N' END AS age_40_plus_yn,
	CASE WHEN gender_id = 1 THEN 'F' WHEN gender_id = 2 THEN 'M' END AS gender_abbr,
	CASE WHEN [disabled] = 1 THEN 'Y' ELSE 'N' END AS disabled_yn,
	CASE WHEN lo.workweek IS NULL OR lo.workweek = 0 THEN NULL
		WHEN lsd.hoursperweek > lo.workweek THEN 100
		ELSE 100*lsd.hoursperweek/lo.workweek END AS pct_full_time,
	ISNULL(pct_time_1, 0) + ISNULL(pct_time_2, 0) + ISNULL(pct_time_3, 0) + ISNULL(pct_time_4, 0) + ISNULL(pct_time_5, 0) AS pct_time_total
	FROM lsc_staff_detail lsd
		join lsc_office lo ON lsd.lsc_office_id = lo.lsc_office_id
