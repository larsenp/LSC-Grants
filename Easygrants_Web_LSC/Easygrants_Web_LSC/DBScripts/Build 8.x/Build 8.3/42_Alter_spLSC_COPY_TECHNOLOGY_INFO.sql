ALTER PROCEDURE [dbo].[spLSC_COPY_TECHNOLOGY_INFO]
	(@wf_task_assignment_id INT)

AS

DECLARE @prev_wfta_id INT

SET @prev_wfta_id = [dbo].[fnLSCPrevYearAppWfTAID] (@wf_task_assignment_id)

IF @prev_wfta_id IS NULL
	RETURN

CREATE TABLE #tech
	(ident int identity(0,1),
	lsc_technology_id int ,
	wf_task_assignment_id int ,
	computer_capacity_desk bit ,
	computer_capacity_training bit ,
	access_research_desktop int ,
	access_research_other int ,
	access_research_none int ,
	connectivity_wi_one bit ,
	connectivity_wi_all bit ,
	connectivity_bt_two bit ,
	connectivity_bt_all bit ,
	dial_up bit ,
	dsl bit ,
	isdn bit ,
	frame bit ,
	t1 bit ,
	cable bit ,
	satellite bit ,
	voice_over_ip bit ,
	voice_over_ip_network varchar(100) ,
	voice_over_ip_bandwidth varchar(100) ,
	voice_over_ip_router varchar(100) ,
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
	real_time_data_entry bit,
	fiber_optics bit,
	describe varchar(max),
	other bit )

INSERT #tech
	(wf_task_assignment_id ,
	computer_capacity_desk ,
	computer_capacity_training ,
	access_research_desktop ,
	access_research_other ,
	access_research_none ,
	connectivity_wi_one ,
	connectivity_wi_all ,
	connectivity_bt_two ,
	connectivity_bt_all ,
	dial_up ,
	dsl ,
	isdn ,
	frame ,
	t1 ,
	cable ,
	satellite ,
	voice_over_ip ,
	voice_over_ip_network ,
	voice_over_ip_bandwidth ,
	voice_over_ip_router ,
	intake_phone ,
	intake_direct ,
	intake_may ,
	intake_incoming ,
	intake_maximum ,
	voice_mail ,
	intake_automated ,
	call_distribution ,
	self_direct ,
	self_select ,
	callback ,
	return_call ,
	telephony ,
	interactive_voice,
	call_routing ,
	disabled_access ,
	review_wait_time ,
	provide_recorded_info ,
	real_time_data_entry,
	fiber_optics ,
	describe ,
	other )
	SELECT @wf_task_assignment_id ,
		computer_capacity_desk ,
		computer_capacity_training ,
		access_research_desktop ,
		access_research_other ,
		access_research_none ,
		connectivity_wi_one ,
		connectivity_wi_all ,
		connectivity_bt_two ,
		connectivity_bt_all ,
		dial_up ,
		dsl ,
		isdn ,
		frame ,
		t1 ,
		cable ,
		satellite ,
		voice_over_ip ,
		voice_over_ip_network ,
		voice_over_ip_bandwidth ,
		voice_over_ip_router ,
		intake_phone ,
		intake_direct ,
		intake_may ,
		intake_incoming ,
		intake_maximum ,
		voice_mail ,
		intake_automated ,
		call_distribution ,
		self_direct ,
		self_select ,
		callback ,
		return_call ,
		telephony ,
		interactive_voice,
		call_routing ,
		disabled_access ,
		review_wait_time ,
		provide_recorded_info ,
		real_time_data_entry,
		fiber_optics ,
		describe ,
		other 
		FROM LSC_TECHNOLOGY
		WHERE wf_task_assignment_id = @prev_wfta_id

--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			
DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #tech

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_TECHNOLOGY', @count = @rowcount, @mode = 2

UPDATE #tech
	SET lsc_technology_id = ident + @first_new_id

INSERT LSC_TECHNOLOGY
	(lsc_technology_id,
	wf_task_assignment_id,
	computer_capacity_desk ,
	computer_capacity_training ,
	access_research_desktop ,
	access_research_other ,
	access_research_none ,
	connectivity_wi_one ,
	connectivity_wi_all ,
	connectivity_bt_two ,
	connectivity_bt_all ,
	dial_up ,
	dsl ,
	isdn ,
	frame ,
	t1 ,
	cable ,
	satellite ,
	voice_over_ip ,
	voice_over_ip_network ,
	voice_over_ip_bandwidth ,
	voice_over_ip_router ,
	intake_phone ,
	intake_direct ,
	intake_may ,
	intake_incoming ,
	intake_maximum ,
	voice_mail ,
	intake_automated ,
	call_distribution ,
	self_direct ,
	self_select ,
	callback ,
	return_call ,
	telephony ,
	interactive_voice,
	call_routing ,
	disabled_access ,
	review_wait_time ,
	provide_recorded_info ,
	real_time_data_entry,
	fiber_optics ,
	describe ,
	other  )
	SELECT lsc_technology_id,
		wf_task_assignment_id,
		computer_capacity_desk ,
		computer_capacity_training ,
		access_research_desktop ,
		access_research_other ,
		access_research_none ,
		connectivity_wi_one ,
		connectivity_wi_all ,
		connectivity_bt_two ,
		connectivity_bt_all ,
		dial_up ,
		dsl ,
		isdn ,
		frame ,
		t1 ,
		cable ,
		satellite ,
		voice_over_ip ,
		voice_over_ip_network ,
		voice_over_ip_bandwidth ,
		voice_over_ip_router ,
		intake_phone ,
		intake_direct ,
		intake_may ,
		intake_incoming ,
		intake_maximum ,
		voice_mail ,
		intake_automated ,
		call_distribution ,
		self_direct ,
		self_select ,
		callback ,
		return_call ,
		telephony ,
		interactive_voice,
		call_routing ,
		disabled_access ,
		review_wait_time ,
		provide_recorded_info ,
		real_time_data_entry,
		fiber_optics ,
		describe ,
		other 
		FROM #tech