/****** Object:  StoredProcedure [dbo].[spLSC_GAR_CSR_CURR_YEAR]    Script Date: 03/04/2009 14:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spLSC_GAR_CSR_CURR_YEAR]
	(@time_period_id Int = NULL,
	@year Int = NULL,
	@service_area_type_id Int = NULL,
	@service_area_type varchar(2) = NULL,
	@organization_id Int = NULL,
	@recipient_id Int = NULL,
	@state_province_id Int = NULL,
	@state varchar(2) = NULL,
	@competition_id Int = NULL,
	@serv_area varchar(10) = NULL,
	@lsc_attorney_pai_status_id Int = NULL,
	@attorney_pai_status varchar(5) = NULL)

AS

--Validate @time_period_id and @year
IF @time_period_id IS NOT NULL AND @year IS NOT NULL
BEGIN
	PRINT 'Parameter values may be provided either for @time_period_id or @year, but not for both.'
	RETURN 1
END

IF @year IS NOT NULL
BEGIN
	SELECT @time_period_id = id
		FROM c_TIME_PERIOD
		WHERE sort_order = @year

	IF @time_period_id IS NULL
	BEGIN
		PRINT 'The value provided for @year is not valid.'
		RETURN 1
	END
END

IF @year IS NULL AND @time_period_id IS NOT NULL
BEGIN
	SELECT @year = sort_order
		FROM c_TIME_PERIOD
		WHERE id = @time_period_id
END


--Validate @service_area_type_id and @service_area_type
IF @service_area_type_id IS NOT NULL AND @service_area_type IS NOT NULL
BEGIN
	PRINT 'Parameter values may be provided either for @service_area_type_id or @service_area_type, but not for both.'
	RETURN 1
END

IF @service_area_type IS NOT NULL
BEGIN
	SELECT @service_area_type_id = id
		FROM LSC_c_SERVICE_AREA_TYPE
		WHERE abbr = @service_area_type

	IF @service_area_type_id IS NULL
	BEGIN
		PRINT 'The value provided for @service_area_type is not valid.'
		RETURN 1
	END
END

--Validate @organization_id and @recipient_id
IF @organization_id IS NOT NULL AND @recipient_id IS NOT NULL
BEGIN
	PRINT 'Parameter values may be provided either for @organization_id or @recipient_id, but not for both.'
	RETURN 1
END

IF @recipient_id IS NOT NULL
BEGIN
	SELECT @organization_id = organization_id
		FROM ORGANIZATION
		WHERE legacy_organization_id = @recipient_id

	IF @organization_id IS NULL
	BEGIN
		PRINT 'The value provided for @recipient_id is not valid.'
		RETURN 1
	END
END

--Validate @state_province_id and @state
IF @state_province_id IS NOT NULL AND @state IS NOT NULL
BEGIN
	PRINT 'Parameter values may be provided either for @state_province_id or @state, but not for both.'
	RETURN 1
END

IF @state IS NOT NULL
BEGIN
	SELECT @state_province_id = id
		FROM c_STATE_PROV
		WHERE abbr = @state

	IF @state_province_id IS NULL
	BEGIN
		PRINT 'The value provided for @state is not valid.'
		RETURN 1
	END
END

--Validate @competition_id and @serv_area
IF @competition_id IS NOT NULL AND @serv_area IS NOT NULL
BEGIN
	PRINT 'Parameter values may be provided either for @competition_id or @serv_area, but not for both.'
	RETURN 1
END

IF @serv_area IS NOT NULL
BEGIN
	SELECT @competition_id = id
		FROM a_COMPETITION
		WHERE abbr = @serv_area

	IF @competition_id IS NULL
	BEGIN
		PRINT 'The value provided for @serv_area is not valid.'
		RETURN 1
	END
END

--Validate @lsc_attorney_pai_status_id and @attorney_pai_status
IF @lsc_attorney_pai_status_id IS NOT NULL AND @attorney_pai_status IS NOT NULL
BEGIN
	PRINT 'Parameter values may be provided either for @lsc_attorney_pai_status_id or @attorney_pai_status, but not for both.'
	RETURN 1
END

IF @attorney_pai_status IS NOT NULL
BEGIN
	SELECT @lsc_attorney_pai_status_id = id
		FROM LSC_c_ATTORNEY_PAI_STATUS
		WHERE abbr = @attorney_pai_status

	IF @lsc_attorney_pai_status_id IS NULL
	BEGIN
		PRINT 'The value provided for @attorney_pai_status is not valid.'
		RETURN 1
	END
END

CREATE TABLE #ct
	(lsc_case_type_id int,
	description varchar(200))

INSERT #ct
	(lsc_case_type_id,
	description)
	SELECT id, description 
		FROM LSC_c_CASE_TYPE
		WHERE end_date IS NULL OR end_date > GETDATE()

--Select data, displaying only the appropriate columns per year
IF @year IS NULL
BEGIN
	select #ct.description case_type, 
		isnull(sum(case when csr.wfta_year > 2007 then	csr.a + csr.b + csr.f + csr.g + csr.h + csr.ia + csr.ib + csr.ic + csr.k + csr.l
			else csr.a + csr.b + csr.c + csr.d + csr.e + csr.f + csr.g + csr.h + csr.i + csr.j + csr.k end), 0) as total,
		isnull(sum(csr.a), 0) A, 
		isnull(sum(csr.b), 0) B, 
		isnull(sum(csr.c), 0) C, 
		isnull(sum(csr.d), 0) D, 
		isnull(sum(csr.e), 0) E, 
		isnull(sum(csr.f), 0) F, 
		isnull(sum(csr.g), 0) G, 
		isnull(sum(csr.h), 0) H, 
		isnull(sum(csr.i), 0) I, 
		isnull(sum(csr.ia), 0) Ia, 
		isnull(sum(csr.ib), 0) Ib, 
		isnull(sum(csr.ic), 0) Ic, 
		isnull(sum(csr.j), 0) J, 
 		isnull(sum(csr.K), 0) K, 
		isnull(sum(csr.L), 0) L
		from #ct
			LEFT JOIN vlsc_csr csr on #ct.lsc_case_type_id = csr.lsc_case_type_id
				and csr.time_period_id = case when @time_period_id is null then csr.time_period_id else @time_period_id end
				and csr.service_area_type_id = case when @service_area_type_id is null then csr.service_area_type_id else @service_area_type_id end
				and csr.organization_id = case when @organization_id is null then csr.organization_id else @organization_id end
				and csr.state_province_id = case when @state_province_id is null then csr.state_province_id else @state_province_id end
				and csr.competition_id = case when @competition_id is null then csr.competition_id else @competition_id end
				and csr.lsc_attorney_pai_status_id = case when @lsc_attorney_pai_status_id is null then csr.lsc_attorney_pai_status_id else @lsc_attorney_pai_status_id end
		group by #ct.description
		order by #ct.description

	RETURN
END

IF @year < 2008
BEGIN
	select #ct.description case_type, 
		isnull(sum(csr.a + csr.b + csr.c + csr.d + csr.e + csr.f + csr.g + csr.h + csr.i + csr.j + csr.k), 0) as total,
		isnull(sum(csr.a), 0) A, 
		isnull(sum(csr.b), 0) B, 
		isnull(sum(csr.c), 0) C, 
		isnull(sum(csr.d), 0) D, 
		isnull(sum(csr.e), 0) E, 
		isnull(sum(csr.f), 0) F, 
		isnull(sum(csr.g), 0) G, 
		isnull(sum(csr.h), 0) H, 
		isnull(sum(csr.i), 0) I, 
		isnull(sum(csr.j), 0) J, 
 		isnull(sum(csr.K), 0) K
		from #ct
			LEFT JOIN vlsc_csr csr on #ct.lsc_case_type_id = csr.lsc_case_type_id
				and csr.time_period_id = case when @time_period_id is null then csr.time_period_id else @time_period_id end
				and csr.service_area_type_id = case when @service_area_type_id is null then csr.service_area_type_id else @service_area_type_id end
				and csr.organization_id = case when @organization_id is null then csr.organization_id else @organization_id end
				and csr.state_province_id = case when @state_province_id is null then csr.state_province_id else @state_province_id end
				and csr.competition_id = case when @competition_id is null then csr.competition_id else @competition_id end
				and csr.lsc_attorney_pai_status_id = case when @lsc_attorney_pai_status_id is null then csr.lsc_attorney_pai_status_id else @lsc_attorney_pai_status_id end
		group by #ct.description
		order by #ct.description

	RETURN
END

IF @year > 2007
BEGIN
	select #ct.description case_type, 
		isnull(sum(csr.a + csr.b + csr.f + csr.g + csr.h + csr.ia + csr.ib + csr.ic + csr.k + csr.l), 0) as total,
		isnull(sum(csr.a), 0) A, 
		isnull(sum(csr.b), 0) B, 
		isnull(sum(csr.f), 0) F, 
		isnull(sum(csr.g), 0) G, 
		isnull(sum(csr.h), 0) H, 
		isnull(sum(csr.ia), 0) Ia, 
		isnull(sum(csr.ib), 0) Ib, 
		isnull(sum(csr.ic), 0) Ic, 
 		isnull(sum(csr.K), 0) K, 
		isnull(sum(csr.L), 0) L
		from #ct
			LEFT JOIN vlsc_csr csr on #ct.lsc_case_type_id = csr.lsc_case_type_id
				and csr.time_period_id = case when @time_period_id is null then csr.time_period_id else @time_period_id end
				and csr.service_area_type_id = case when @service_area_type_id is null then csr.service_area_type_id else @service_area_type_id end
				and csr.organization_id = case when @organization_id is null then csr.organization_id else @organization_id end
				and csr.state_province_id = case when @state_province_id is null then csr.state_province_id else @state_province_id end
				and csr.competition_id = case when @competition_id is null then csr.competition_id else @competition_id end
				and csr.lsc_attorney_pai_status_id = case when @lsc_attorney_pai_status_id is null then csr.lsc_attorney_pai_status_id else @lsc_attorney_pai_status_id end
		group by #ct.description
		order by #ct.description

	RETURN
END
