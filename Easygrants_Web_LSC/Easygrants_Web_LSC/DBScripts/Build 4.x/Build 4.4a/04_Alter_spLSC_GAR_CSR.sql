/****** Object:  StoredProcedure [dbo].[spLSC_GAR_CSR]    Script Date: 02/24/2009 09:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spLSC_GAR_CSR]
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


--Select data
select case_type, 
	sum(a) + sum(b) + sum(c) + sum(d) + sum(e) + sum(f) + sum(g) + sum(h) + sum(i) + sum(ia) + sum(ib) + sum(ic) + sum(j) + sum(k) + sum(l) total,
	sum(a) A, 
	sum(b) B, 
	sum(c) C, 
	sum(d) D, 
	sum(e) E, 
	sum(f) F, 
	sum(g) G, 
	sum(h) H, 
	sum(i) I, 
	sum(ia) Ia, 
	sum(ib) Ib, 
	sum(ic) Ic, 
	sum(j) J, 
 	sum(K) K, 
	sum(L) L
	from vlsc_csr
	where time_period_id = case when @time_period_id is null then time_period_id else @time_period_id end
		and service_area_type_id = case when @service_area_type_id is null then service_area_type_id else @service_area_type_id end
		and organization_id = case when @organization_id is null then organization_id else @organization_id end
		and state_province_id = case when @state_province_id is null then state_province_id else @state_province_id end
		and competition_id = case when @competition_id is null then competition_id else @competition_id end
		and lsc_attorney_pai_status_id = case when @lsc_attorney_pai_status_id is null then lsc_attorney_pai_status_id else @lsc_attorney_pai_status_id end
	group by case_type
	order by case_type