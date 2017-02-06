CREATE PROCEDURE spLSC_INSERT_LSC_PQV_RECOMMENDATION_SERVAREA
	(@wfta_id INT)

AS

DECLARE @report_id int,
	@competition_id int,
	@time_period_id int,
	@prev_time_period_id int,
	@r_count int,
	@rsa_count int

--Find most recent report
SELECT TOP 1 @report_id = prvd.lsc_pqv_report_id
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN vLSC_PQV_Recommendation_Visit_data prvd on gp.primary_organization_id = prvd.organization_id
	WHERE wfta.wf_task_assignment_id = @wfta_id
	ORDER BY prvd.visit_date desc

--Get current service area and year
SELECT @competition_id = competition_id,
	@time_period_id = time_period_id 
	FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy
	WHERE cwosy.wf_task_assignment_id = @wfta_id

--Get previous year
SELECT @prev_time_period_id = id
	FROM c_TIME_PERIOD
	WHERE sort_order + 1 =
		(SELECT sort_order
			FROM c_TIME_PERIOD
			WHERE id = @time_period_id)

--Count recommendations from most recent report
SELECT @r_count = COUNT(*)
	FROM LSC_PQV_RECOMMENDATION
	WHERE lsc_pqv_report_id = @report_id

--Count LSC_PQV_RECOMMENDATION_SERVAREA rows for most recent report for current service area and year
SELECT @rsa_count = COUNT(*)
	FROM LSC_PQV_RECOMMENDATION_SERVAREA rsa
		JOIN LSC_PQV_RECOMMENDATION r ON rsa.lsc_pqv_recommendation_id = r.lsc_pqv_recommendation_id
	WHERE rsa.time_period_id = @time_period_id
		AND rsa.competition_id = @competition_id
		AND r.lsc_pqv_report_id = @report_id

SELECT @r_count AS r_count,
	@rsa_count AS rsa_count

--If there are recommendations without corresponding LSC_PQV_RECOMMENDATION_SERVAREA rows, write new rows to LSC_PQV_RECOMMENDATION_SERVAREA.
IF @r_count > 0 AND @rsa_count = 0
BEGIN

	CREATE TABLE #rsa
		(ident int identity(0,1),
		lsc_pqv_recommendation_servarea_id int,
		lsc_pqv_recommendation_id int,
		competition_id int,
		time_period_id int)

	INSERT #rsa
		(lsc_pqv_recommendation_id ,
		competition_id ,
		time_period_id )
		SELECT r.lsc_pqv_recommendation_id ,
			@competition_id ,
			@time_period_id 
			FROM LSC_PQV_RECOMMENDATION r
				JOIN LSC_PQV_RECOMMENDATION_SERVAREA rsa ON r.lsc_pqv_recommendation_id = rsa.lsc_pqv_recommendation_id
			WHERE lsc_pqv_report_id = @report_id
				AND rsa.competition_id = @competition_id
				AND rsa.time_period_id = @prev_time_period_id

	DECLARE @rowcount int,
		@first_id int

	SELECT @rowcount = COUNT(*)
		FROM #rsa

	EXECUTE @first_id = spGETID_RANGE_SEL
	   @table = LSC_PQV_RECOMMENDATION_SERVAREA
	  ,@count = @rowcount
	  ,@mode = 2

	UPDATE #rsa
		SET lsc_pqv_recommendation_servarea_id = ident + @first_id

	INSERT LSC_PQV_RECOMMENDATION_SERVAREA
		(lsc_pqv_recommendation_servarea_id ,
		lsc_pqv_recommendation_id ,
		competition_id ,
		time_period_id )
		SELECT lsc_pqv_recommendation_servarea_id ,
			lsc_pqv_recommendation_id ,
			competition_id ,
			time_period_id
			FROM #rsa

	SELECT * FROM #rsa

	DROP TABLE #rsa

END