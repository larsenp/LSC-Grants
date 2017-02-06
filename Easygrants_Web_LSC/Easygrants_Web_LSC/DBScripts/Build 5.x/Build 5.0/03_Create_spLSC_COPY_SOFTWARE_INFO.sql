/****** Object:  StoredProcedure [dbo].[spLSC_COPY_SOFTWARE_INFO]    Script Date: 03/16/2009 17:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLSC_COPY_SOFTWARE_INFO]
	(@wf_task_assignment_id INT)

AS

SET NOCOUNT ON

DECLARE @prev_wfta_id INT

SET @prev_wfta_id = [dbo].[fnLSCPrevYearAppWfTAID] (@wf_task_assignment_id)

/**/print '@prev_wfta_id = ' + cast(@prev_wfta_id as varchar(6))

IF @prev_wfta_id IS NULL
	RETURN

CREATE TABLE #sw
	(ident int identity(0,1),
	lsc_software_id int ,
	lsc_software_product_id int ,
	wf_task_assignment_id int ,
	in_use bit,
	version varchar(50) ,
	percent_staff int )

INSERT #sw
	(lsc_software_product_id ,
	wf_task_assignment_id ,
	in_use ,
	version ,
	percent_staff)
	SELECT lsc_software_product_id ,
		@wf_task_assignment_id ,
		in_use ,
		version ,
		percent_staff
		FROM LSC_SOFTWARE s
			JOIN dbo.LSC_c_SOFTWARE_PRODUCT sp on s.lsc_software_product_id = sp.id
		WHERE wf_task_assignment_id = @prev_wfta_id
			AND (sp.end_date IS NULL or sp.end_date <= GETDATE())

/**/print cast(@@rowcount as varchar(5)) + ' rows inserted into #sw'

CREATE TABLE #swq
	(ident int identity(0,1),
	lsc_software_question_id int ,
	wf_task_assignment_id int ,
	case_management_single_db bit ,
	dedicated_timekeeping_sw bit ,
	timekeeping_sw_name varchar(50) ,
	remote_access_sw bit ,
	vpn bit ,
	backup_protocol_network varchar(max) ,
	backup_protocol_pc varchar(max) ,
	backup_storage_location varchar(max) ,
	backup_last_restore varchar(max) ,
	backup_access varchar(max) ,
	web_software_product_id int ,
	web_software_product_other varchar(100) ,
	web_db_software_product_id int ,
	web_db_software_product_other varchar(100) ,
	swws_url varchar(100) ,
	swws_coord_name_first varchar(100) ,
	swws_coord_name_last varchar(100) ,
	swws_coord_phone varchar(50) ,
	swws_coord_email varchar(100) ,
	hotdocs_use bit ,
	hotdocs_use_description varchar(max) ,
	swws_financial_contribution varchar(max) ,
	swws_financial_contribution_amount varchar(max) ,
	swws_content_contribution varchar(max) ,
	swws_content_description varchar(max) ,
	swws_program_priorities varchar(max) ,
	swws_content_update_protocols varchar(max) ,
	swws_content_languages varchar(max) ,
	swws_stakeholder_mtgs varchar(max) ,
	swws_outreach varchar(max) ,
	swws_outreach_description varchar(max) ,
	swws_staff_familiar varchar(max) ,
	swws_usage_monitoring varchar(max) ,
	swws_usage_info_evaluation varchar(max) ,
	swws_accessibility varchar(max) ,
	swws_delivery_role varchar(max) ,
	program_web_site bit ,
	pws_url varchar(100) ,
	pws_lsc_funded bit ,
	program_tech_contact_name_first varchar(100) ,
	program_tech_contact_name_last varchar(100) ,
	program_tech_contact_phone varchar(50) ,
	program_tech_contact_email varchar(100) ,
	sw_tech_contact_name_first varchar(100) ,
	sw_tech_contact_name_last varchar(100) ,
	sw_tech_contact_phone varchar(50) ,
	sw_tech_contact_email varchar(100) ,
	program_legalmeetings_host bit ,
	program_legalmeetings_usage varchar(max) ,
	applicant_internet_usage varchar(max)) 

INSERT #swq
	(wf_task_assignment_id ,
	case_management_single_db ,
	dedicated_timekeeping_sw ,
	timekeeping_sw_name ,
	remote_access_sw ,
	vpn ,
	backup_protocol_network ,
	backup_protocol_pc ,
	backup_storage_location ,
	backup_last_restore ,
	backup_access ,
	web_software_product_id ,
	web_software_product_other ,
	web_db_software_product_id ,
	web_db_software_product_other ,
	swws_url ,
	swws_coord_name_first ,
	swws_coord_name_last ,
	swws_coord_phone ,
	swws_coord_email ,
	hotdocs_use ,
	hotdocs_use_description ,
	swws_financial_contribution ,
	swws_financial_contribution_amount ,
	swws_content_contribution ,
	swws_content_description ,
	swws_program_priorities ,
	swws_content_update_protocols ,
	swws_content_languages ,
	swws_stakeholder_mtgs ,
	swws_outreach ,
	swws_outreach_description ,
	swws_staff_familiar ,
	swws_usage_monitoring ,
	swws_usage_info_evaluation ,
	swws_accessibility ,
	swws_delivery_role ,
	program_web_site ,
	pws_url ,
	pws_lsc_funded ,
	program_tech_contact_name_first ,
	program_tech_contact_name_last ,
	program_tech_contact_phone ,
	program_tech_contact_email ,
	sw_tech_contact_name_first ,
	sw_tech_contact_name_last ,
	sw_tech_contact_phone ,
	sw_tech_contact_email ,
	program_legalmeetings_host ,
	program_legalmeetings_usage ,
	applicant_internet_usage ) 
	SELECT  @wf_task_assignment_id ,
		case_management_single_db ,
		dedicated_timekeeping_sw ,
		timekeeping_sw_name ,
		remote_access_sw ,
		vpn ,
		backup_protocol_network ,
		backup_protocol_pc ,
		backup_storage_location ,
		backup_last_restore ,
		backup_access ,
		web_software_product_id ,
		web_software_product_other ,
		web_db_software_product_id ,
		web_db_software_product_other ,
		swws_url ,
		swws_coord_name_first ,
		swws_coord_name_last ,
		swws_coord_phone ,
		swws_coord_email ,
		hotdocs_use ,
		hotdocs_use_description ,
		swws_financial_contribution ,
		swws_financial_contribution_amount ,
		swws_content_contribution ,
		swws_content_description ,
		swws_program_priorities ,
		swws_content_update_protocols ,
		swws_content_languages ,
		swws_stakeholder_mtgs ,
		swws_outreach ,
		swws_outreach_description ,
		swws_staff_familiar ,
		swws_usage_monitoring ,
		swws_usage_info_evaluation ,
		swws_accessibility ,
		swws_delivery_role ,
		program_web_site ,
		pws_url ,
		pws_lsc_funded ,
		program_tech_contact_name_first ,
		program_tech_contact_name_last ,
		program_tech_contact_phone ,
		program_tech_contact_email ,
		sw_tech_contact_name_first ,
		sw_tech_contact_name_last ,
		sw_tech_contact_phone ,
		sw_tech_contact_email ,
		program_legalmeetings_host ,
		program_legalmeetings_usage ,
		applicant_internet_usage
		FROM LSC_SOFTWARE_QUESTION 
		WHERE wf_task_assignment_id = @prev_wfta_id

/**/print cast(@@rowcount as varchar(5)) + ' rows inserted into #swq'


BEGIN TRY
	BEGIN TRAN
		DECLARE @rowcount int, @first_new_id int

		SELECT @rowcount = count(*) FROM #sw

		EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_SOFTWARE', @count = @rowcount, @mode = 2

		UPDATE #sw
			SET lsc_software_id = ident + @first_new_id


		SELECT @rowcount = count(*) FROM #swq

		EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_SOFTWARE_QUESTION', @count = @rowcount, @mode = 2

		UPDATE #swq
			SET lsc_software_question_id = ident + @first_new_id

		INSERT LSC_SOFTWARE
			(lsc_software_id, 
			lsc_software_product_id ,
			wf_task_assignment_id ,
			in_use ,
			version ,
			percent_staff)
			SELECT lsc_software_id, 
				lsc_software_product_id ,
				wf_task_assignment_id ,
				in_use ,
				version ,
				percent_staff
				FROM #sw

/**/print cast(@@rowcount as varchar(5)) + ' rows inserted into LSC_SOFTWARE'


		INSERT LSC_SOFTWARE_QUESTION 
			(lsc_software_question_id,
			wf_task_assignment_id ,
			case_management_single_db ,
			dedicated_timekeeping_sw ,
			timekeeping_sw_name ,
			remote_access_sw ,
			vpn ,
			backup_protocol_network ,
			backup_protocol_pc ,
			backup_storage_location ,
			backup_last_restore ,
			backup_access ,
			web_software_product_id ,
			web_software_product_other ,
			web_db_software_product_id ,
			web_db_software_product_other ,
			swws_url ,
			swws_coord_name_first ,
			swws_coord_name_last ,
			swws_coord_phone ,
			swws_coord_email ,
			hotdocs_use ,
			hotdocs_use_description ,
			swws_financial_contribution ,
			swws_financial_contribution_amount ,
			swws_content_contribution ,
			swws_content_description ,
			swws_program_priorities ,
			swws_content_update_protocols ,
			swws_content_languages ,
			swws_stakeholder_mtgs ,
			swws_outreach ,
			swws_outreach_description ,
			swws_staff_familiar ,
			swws_usage_monitoring ,
			swws_usage_info_evaluation ,
			swws_accessibility ,
			swws_delivery_role ,
			program_web_site ,
			pws_url ,
			pws_lsc_funded ,
			program_tech_contact_name_first ,
			program_tech_contact_name_last ,
			program_tech_contact_phone ,
			program_tech_contact_email ,
			sw_tech_contact_name_first ,
			sw_tech_contact_name_last ,
			sw_tech_contact_phone ,
			sw_tech_contact_email ,
			program_legalmeetings_host ,
			program_legalmeetings_usage ,
			applicant_internet_usage ) 
			SELECT  lsc_software_question_id,
				wf_task_assignment_id ,
				case_management_single_db ,
				dedicated_timekeeping_sw ,
				timekeeping_sw_name ,
				remote_access_sw ,
				vpn ,
				backup_protocol_network ,
				backup_protocol_pc ,
				backup_storage_location ,
				backup_last_restore ,
				backup_access ,
				web_software_product_id ,
				web_software_product_other ,
				web_db_software_product_id ,
				web_db_software_product_other ,
				swws_url ,
				swws_coord_name_first ,
				swws_coord_name_last ,
				swws_coord_phone ,
				swws_coord_email ,
				hotdocs_use ,
				hotdocs_use_description ,
				swws_financial_contribution ,
				swws_financial_contribution_amount ,
				swws_content_contribution ,
				swws_content_description ,
				swws_program_priorities ,
				swws_content_update_protocols ,
				swws_content_languages ,
				swws_stakeholder_mtgs ,
				swws_outreach ,
				swws_outreach_description ,
				swws_staff_familiar ,
				swws_usage_monitoring ,
				swws_usage_info_evaluation ,
				swws_accessibility ,
				swws_delivery_role ,
				program_web_site ,
				pws_url ,
				pws_lsc_funded ,
				program_tech_contact_name_first ,
				program_tech_contact_name_last ,
				program_tech_contact_phone ,
				program_tech_contact_email ,
				sw_tech_contact_name_first ,
				sw_tech_contact_name_last ,
				sw_tech_contact_phone ,
				sw_tech_contact_email ,
				program_legalmeetings_host ,
				program_legalmeetings_usage ,
				applicant_internet_usage
				FROM #swq

/**/print cast(@@rowcount as varchar(5)) + ' rows inserted into LSC_SOFTWARE_QUESTION'

	COMMIT TRAN
END TRY

BEGIN CATCH
	SELECT 'Rolling back transaction' as [status],
		ERROR_NUMBER() as ErrorNumber,
		ERROR_MESSAGE() as ErrorMessage;
	ROLLBACK TRAN
END CATCH

