/****** Object:  StoredProcedure [dbo].[spLSC_GAR_PROJECTED_REVENUE]    Script Date: 03/24/2009 12:06:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLSC_GAR_PROJECTED_REVENUE]
	(@time_period_id int = NULL,
	@year int = NULL,
	@service_area_type_id int = NULL,
	@service_area_type varchar(2) = NULL,
	@organization_id int = NULL,
	@recipient_id int = NULL,
	@state_province_id int = NULL,
	@state varchar(2) = NULL,
	@competition_id int = NULL,
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


select bcp.description funding_source_type,
	bc.lsc_fund_code,
	bc.description funding_source,
	SUM(bi.amount) amount
	from WF_TASK_ASSIGNMENT wfta
		join vLSC_WFTA_BUDGET_PERIOD wbp on wfta.wf_task_assignment_id = wbp.wf_task_assignment_id
		join vWFTA_COMPETITION_YEAR wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join organization o on gp.primary_organization_id = o.organization_id
		join a_wf_project wfp on gp.wf_project_id = wfp.id
		join a_competition c on wfp.competition_id = c.id
		join LSC_a_SERVICE_AREA sa ON c.id = sa.competition_id
		join LSC_c_SERVICE_AREA_TYPE sat ON sa.service_area_type_id = sat.id
		join budget_item bi on wbp.budget_period_id = bi.budget_period_id
		join a_budget_category bc on bi.budget_category_id = bc.budget_category_id
		join a_budget_category bcp on bc.parent_id = bcp.budget_category_id
		join c_STATE_PROV sp on sa.state_province_id = sp.id
	where wfta.wf_task_id = 20
		and bc.category_type_id = 7
		and bc.lsc_fund_code is not null
		and wcy.time_period_id = case when @time_period_id is null then wfp.time_period_id else @time_period_id end
		and sa.service_area_type_id = case when @service_area_type_id is null then sa.service_area_type_id else @service_area_type_id end
		and o.organization_id = case when @organization_id is null then o.organization_id else @organization_id end
		and sa.state_province_id = case when @state_province_id is null then sa.state_province_id else @state_province_id end
		and c.id = case when @competition_id is null then c.id else @competition_id end
	GROUP BY bcp.description,
		bc.lsc_fund_code,
		bc.description,
		bc.sort_order
	order by bc.sort_order

GO

GRANT EXECUTE ON [dbo].[spLSC_GAR_PROJECTED_REVENUE] TO [LSC.GOV\OIM WebDev]