ALTER PROCEDURE [dbo].[spLSC_COPY_TECHNOLOGY_INFO]
	(@wf_task_assignment_id INT)

AS

DECLARE @prev_wfta_id INT,
    @organization_id INT,
	@time_period_id INT,
	@year INT,
	@prev_time_period_id INT,
	@tech_count INT,
	@rowcount int, 
	@first_new_id int

SET @prev_wfta_id = [dbo].[fnLSCPrevYearAppWfTAID] (@wf_task_assignment_id)

IF @prev_wfta_id IS NULL
	RETURN

SELECT @organization_id = organization_id,
	@time_period_id = time_period_id,
	@year = wfta_year
	FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR
	WHERE wf_task_assignment_id = @wf_task_assignment_id

SELECT @prev_time_period_id = id
	FROM c_TIME_PERIOD
	WHERE sort_order = @year - 1

SELECT @tech_count = COUNT(*)
	FROM LSC_TECHNOLOGY
	WHERE organization_id = @organization_id
		AND time_period_id = @time_period_id

--Insert Technology form information only if it has not been inserted already.
--Information for this organization and year may already have been inserted in the context of a different task assignment.
IF @tech_count = 0
BEGIN
	CREATE TABLE #tech
		(ident int identity(0,1),
		lsc_technology_id int ,
		connectivity_bt_all bit ,
		dial_up bit ,
		dsl bit ,
		isdn bit ,
		frame bit ,
		t1 bit ,
		cable bit ,
		satellite bit ,
		fiber_optics bit,
		describe varchar(max),
		other bit,
		organization_id INT NULL,
		time_period_id INT NULL,
		access_files_across_offices BIT NULL,
		search_files_across_offices BIT NULL,
		videoconf_web_based BIT NULL,
		videoconf_standalone BIT NULL,
		webconf BIT NULL)

	INSERT #tech
		(connectivity_bt_all ,
		dial_up ,
		dsl  ,
		isdn ,
		frame ,
		t1  ,
		cable ,
		satellite ,
		fiber_optics ,
		describe ,
		other ,
		organization_id ,
		time_period_id,
		access_files_across_offices ,
		search_files_across_offices ,
		videoconf_web_based ,
		videoconf_standalone,
		webconf )
		SELECT connectivity_bt_all ,
			dial_up ,
			dsl ,
			isdn ,
			frame ,
			t1 ,
			cable ,
			satellite ,
			fiber_optics ,
			describe ,
			other,
			@organization_id ,
			@time_period_id,
			access_files_across_offices ,
			search_files_across_offices ,
			videoconf_web_based ,
			videoconf_standalone,
			webconf
			FROM LSC_TECHNOLOGY
			WHERE @organization_id = organization_id
				AND time_period_id = @prev_time_period_id

	--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			
	SELECT @rowcount = count(*) FROM #tech

	EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_TECHNOLOGY', @count = @rowcount, @mode = 2

	UPDATE #tech
		SET lsc_technology_id = ident + @first_new_id
END --IF @tech_count > 0

--Collect information for the Intake Technology form
CREATE TABLE #intake
	(ident int identity(0,1),
	lsc_technology_id int ,
	wf_task_assignment_id int ,
	intake_phone int ,
	intake_direct bit ,
	intake_may bit ,
	intake_incoming int ,
	intake_maximum int ,
	voice_mail bit ,
	intake_automated bit ,
	call_distribution bit ,
	self_direct bit ,
	self_select bit ,
	callback bit ,
	return_call bit ,
	telephony bit ,
	interactive_voice bit,
	call_routing bit,
	disabled_access bit,
	review_wait_time bit,
	provide_recorded_info bit,
	real_time_data_entry bit)

INSERT #intake
	(wf_task_assignment_id ,
	intake_phone ,
	intake_direct ,
	intake_may  ,
	intake_incoming ,
	intake_maximum ,
	voice_mail ,
	intake_automated ,
	call_distribution,
	self_direct ,
	self_select ,
	callback  ,
	return_call ,
	telephony ,
	interactive_voice ,
	call_routing ,
	disabled_access ,
	review_wait_time ,
	provide_recorded_info ,
	real_time_data_entry)
	SELECT @wf_task_assignment_id ,
		intake_phone ,
		intake_direct ,
		intake_may  ,
		intake_incoming ,
		intake_maximum ,
		voice_mail ,
		intake_automated ,
		call_distribution,
		self_direct ,
		self_select ,
		callback  ,
		return_call ,
		telephony ,
		interactive_voice ,
		call_routing ,
		disabled_access ,
		review_wait_time ,
		provide_recorded_info ,
		real_time_data_entry
		FROM LSC_TECHNOLOGY
		WHERE wf_task_assignment_id = @prev_wfta_id

--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			
SELECT @rowcount = count(*) FROM #intake

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_TECHNOLOGY', @count = @rowcount, @mode = 2

UPDATE #intake
	SET lsc_technology_id = ident + @first_new_id

IF @tech_count = 0
BEGIN
	INSERT LSC_TECHNOLOGY
		(lsc_technology_id,
		connectivity_bt_all ,
		dial_up ,
		dsl  ,
		isdn ,
		frame ,
		t1  ,
		cable ,
		satellite ,
		fiber_optics ,
		describe ,
		other ,
		organization_id ,
		time_period_id,
		access_files_across_offices ,
		search_files_across_offices ,
		videoconf_web_based ,
		videoconf_standalone,
		webconf )
		SELECT lsc_technology_id,
			connectivity_bt_all ,
			dial_up ,
			dsl  ,
			isdn ,
			frame ,
			t1  ,
			cable ,
			satellite ,
			fiber_optics ,
			describe ,
			other ,
			organization_id ,
			time_period_id,
			access_files_across_offices ,
			search_files_across_offices ,
			videoconf_web_based ,
			videoconf_standalone ,
			webconf
			FROM #tech
END

INSERT LSC_TECHNOLOGY
	(lsc_technology_id,
	wf_task_assignment_id ,
	intake_phone ,
	intake_direct ,
	intake_may  ,
	intake_incoming ,
	intake_maximum ,
	voice_mail ,
	intake_automated ,
	call_distribution,
	self_direct ,
	self_select ,
	callback  ,
	return_call ,
	telephony ,
	interactive_voice ,
	call_routing ,
	disabled_access ,
	review_wait_time ,
	provide_recorded_info ,
	real_time_data_entry)
	SELECT lsc_technology_id,
		wf_task_assignment_id ,
		intake_phone ,
		intake_direct ,
		intake_may  ,
		intake_incoming ,
		intake_maximum ,
		voice_mail ,
		intake_automated ,
		call_distribution,
		self_direct ,
		self_select ,
		callback  ,
		return_call ,
		telephony ,
		interactive_voice ,
		call_routing ,
		disabled_access ,
		review_wait_time ,
		provide_recorded_info ,
		real_time_data_entry
		FROM #intake
