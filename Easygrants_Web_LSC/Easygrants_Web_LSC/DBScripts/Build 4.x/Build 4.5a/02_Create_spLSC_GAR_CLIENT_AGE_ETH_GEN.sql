/****** Object:  StoredProcedure [dbo].[spLSC_GAR_CLIENT_AGE_ETH_GEN]    Script Date: 03/09/2009 16:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLSC_GAR_CLIENT_AGE_ETH_GEN]
	(@time_period_id Int = NULL,
	@year Int = NULL,
	@service_area_type_id Int = NULL,
	@service_area_type varchar(2) = NULL,
	@organization_id Int = NULL,
	@recipient_id Int = NULL,
	@serv_area_state_province_id Int = NULL,
	@serv_area_state varchar(2) = NULL,
	@grantee_state_province_id Int = NULL,
	@grantee_state varchar(2) = NULL,
	@competition_id Int = NULL,
	@serv_area varchar(10) = NULL)

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

--Validate @serv_area_state_province_id and @serv_area_state
IF @serv_area_state_province_id IS NOT NULL AND @serv_area_state IS NOT NULL
BEGIN
	PRINT 'Parameter values may be provided either for @serv_area_state_province_id or @serv_area_state, but not for both.'
	RETURN 1
END

IF @serv_area_state IS NOT NULL
BEGIN
	SELECT @serv_area_state_province_id = id
		FROM c_STATE_PROV
		WHERE abbr = @serv_area_state

	IF @serv_area_state_province_id IS NULL
	BEGIN
		PRINT 'The value provided for @serv_area_state is not valid.'
		RETURN 1
	END
END

--Validate @grantee_state_province_id and @grantee_state
IF @grantee_state_province_id IS NOT NULL AND @grantee_state IS NOT NULL
BEGIN
	PRINT 'Parameter values may be provided either for @grantee_state_province_id or @grantee_state, but not for both.'
	RETURN 1
END

IF @grantee_state IS NOT NULL
BEGIN
	SELECT @grantee_state_province_id = id
		FROM c_STATE_PROV
		WHERE abbr = @grantee_state

	IF @grantee_state_province_id IS NULL
	BEGIN
		PRINT 'The value provided for @grantee_state is not valid.'
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

--Select data

SELECT sum(men) men,
	sum(women) women,
	sum(groups) groups,
	sum(white_0_17) white_0_17,
	sum(black_0_17) black_0_17,
	sum(hisp_0_17) hisp_0_17,
	sum(nat_amr_0_17) nat_amr_0_17,
	sum(asian_0_17) asian_0_17,
	sum(other_0_17) other_0_17,
	sum(total_0_17) total_0_17,
	sum(white_18_59) white_18_59,
	sum(black_18_59) black_18_59,
	sum(hisp_18_59) hisp_18_59,
	sum(nat_amr_18_59) nat_amr_18_59,
	sum(asian_18_59) asian_18_59,
	sum(other_18_59) other_18_59,
	sum(total_18_59) total_18_59,
	sum(white_60_ovr) white_60_ovr,
	sum(black_60_ovr) black_60_ovr,
	sum(hisp_60_ovr) hisp_60_ovr,
	sum(nat_amr_60_ovr) nat_amr_60_ovr,
	sum(asian_60_ovr) asian_60_ovr,
	sum(other_60_ovr) other_60_ovr,
	sum(total_60_ovr) total_60_ovr,
	sum(white_total) white_total,
	sum(black_total) black_total,
	sum(hisp_total) hisp_total,
	sum(nat_amr_total) nat_amr_total,
	sum(asian_total) asian_total,
	sum(other_total) other_total,
	sum(grand_total) grand_total
	from vLSC_CLIENT_AGE_ETH_GEN
	where organization_id = case when @organization_id is null then organization_id else @organization_id end
		and service_area_type_id = case when @service_area_type_id is null then service_area_type_id else @service_area_type_id end
		and time_period_id = case when @time_period_id is null then time_period_id else @time_period_id end
		and serv_area_state_province_id = case when @serv_area_state_province_id is null then serv_area_state_province_id else @serv_area_state_province_id end
		and grantee_state_province_id = case when @grantee_state_province_id is null then grantee_state_province_id else @grantee_state_province_id end
		and competition_id = case when @competition_id is null then competition_id else @competition_id end


GRANT EXECUTE ON [dbo].[spLSC_GAR_CLIENT_AGE_ETH_GEN] TO [LSC.GOV\OIM WebDev]