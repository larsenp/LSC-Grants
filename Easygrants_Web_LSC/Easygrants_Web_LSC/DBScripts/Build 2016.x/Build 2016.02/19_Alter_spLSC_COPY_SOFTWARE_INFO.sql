USE [EasygrantsDev]
GO
/****** Object:  StoredProcedure [dbo].[spLSC_COPY_SOFTWARE_INFO]    Script Date: 4/19/2016 3:17:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spLSC_COPY_SOFTWARE_INFO]
	(@wf_task_assignment_id INT)

AS

SET NOCOUNT ON

DECLARE @organization_id INT,
		@time_period_id INT,
		@year INT,
		@prev_time_period_id INT

SELECT @organization_id = organization_id,
	@time_period_id = time_period_id,
	@year = wfta_year
	FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR
	WHERE wf_task_assignment_id = @wf_task_assignment_id

SELECT @prev_time_period_id = id
	FROM c_TIME_PERIOD
	WHERE sort_order = @year - 1

CREATE TABLE #sw
	(ident int identity(0,1),
	lsc_software_id int ,
	lsc_software_product_id int ,
	in_use bit,
	percent_staff int,
    organization_id INT NULL,
	time_period_id INT NULL)

INSERT #sw
	(lsc_software_product_id ,
	in_use ,
	percent_staff,
    organization_id,
	time_period_id )
	SELECT lsc_software_product_id ,
		in_use ,
		percent_staff,
        @organization_id ,
		@time_period_id
		FROM LSC_SOFTWARE s
			JOIN dbo.LSC_c_SOFTWARE_PRODUCT sp on s.lsc_software_product_id = sp.id
		WHERE organization_id = @organization_id 
			AND time_period_id = @prev_time_period_id
			AND (sp.end_date IS NULL or sp.end_date >= GETDATE())

/**/print cast(@@rowcount as varchar(5)) + ' rows inserted into #sw'

CREATE TABLE #swq
	(ident int identity(0,1),
	lsc_software_question_id int ,
	dedicated_timekeeping_sw bit ,
	timekeeping_sw_name varchar(50) ,
	remote_access_portion int ,
	vpn bit ,
	swws_url varchar(100) ,
	swws_coord_name_first varchar(100) ,
	swws_coord_name_last varchar(100) ,
	swws_coord_phone varchar(50) ,
	swws_coord_email varchar(100) ,
	swws_financial_contribution varchar(max) ,
	swws_financial_contribution_amount varchar(max) ,
--	swws_content_contribution varchar(max) ,
--	swws_stakeholder_mtgs varchar(max) ,
--	swws_outreach varchar(max) ,
	program_web_site bit ,
	pws_url varchar(100) ,
	pws_lsc_funded bit ,
	program_tech_contact_name_first varchar(100) ,
	program_tech_contact_name_last varchar(100) ,
	program_tech_contact_phone varchar(50) ,
	program_tech_contact_email varchar(100) ,
	pwc_name_first varchar(100),
	pwc_name_last varchar(100),
	pwc_phone varchar(50),
	pwc_email varchar(100),
	sw_tech_contact_name_first varchar(100) ,
	sw_tech_contact_name_last varchar(100) ,
	sw_tech_contact_phone varchar(50) ,
	sw_tech_contact_email varchar(100) ,
	swws_pro_bono bit,
	a2j_author_use bit,
	a2j_author_pro_se bit,
	a2j_author_staff_pro_bono bit,
	a2j_author_online_intake bit,
	legal_research_desc varchar(max),
    organization_id INT NULL,
	time_period_id INT NULL,
	legal_aid_url varchar(500),
	adwords bit,
	swws_cms bit,
	swws_cms_comment varchar(max),
	has_social_media bit,
	automated_form_use bit,
	automated_form_other bit,
	automated_form_pro_se bit,
	automated_form_staff_advocate bit,
	automated_form_pro_bono bit,
	automated_form_staff_must_use bit,
	automated_form_most_freq varchar(max),
	automated_form_count int,
	automated_form_created_by_staff bit,
	automated_form_created_by_law_student bit,
	automated_form_created_by_pro_bono bit,
	automated_form_created_by_contractor bit) 

INSERT #swq
	(dedicated_timekeeping_sw ,
	timekeeping_sw_name ,
	vpn ,
	swws_url ,
	swws_coord_name_first ,
	swws_coord_name_last ,
	swws_coord_phone ,
	swws_coord_email ,
	swws_financial_contribution ,
	swws_financial_contribution_amount ,
--	swws_content_contribution ,
--	swws_stakeholder_mtgs ,
--	swws_outreach ,
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
	swws_pro_bono ,
	a2j_author_use ,
	a2j_author_pro_se ,
	a2j_author_staff_pro_bono ,
	a2j_author_online_intake ,
	legal_research_desc,
    organization_id ,
	time_period_id,
	legal_aid_url,
	adwords,
	swws_cms ,
	swws_cms_comment ,
	has_social_media ,
	automated_form_use ,
	automated_form_other ,
	automated_form_pro_se ,
	automated_form_staff_advocate ,
	automated_form_pro_bono ,
	automated_form_staff_must_use ,
	automated_form_most_freq ,
	automated_form_count ,
	automated_form_created_by_staff ,
	automated_form_created_by_law_student ,
	automated_form_created_by_pro_bono ,
	automated_form_created_by_contractor ) 
	SELECT dedicated_timekeeping_sw ,
		timekeeping_sw_name ,
		vpn ,
		swws_url ,
		swws_coord_name_first ,
		swws_coord_name_last ,
		swws_coord_phone ,
		swws_coord_email ,
		swws_financial_contribution ,
		swws_financial_contribution_amount ,
--		swws_content_contribution ,
--		swws_stakeholder_mtgs ,
--		swws_outreach ,
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
		swws_pro_bono ,
		a2j_author_use ,
		a2j_author_pro_se ,
		a2j_author_staff_pro_bono ,
		a2j_author_online_intake ,
		legal_research_desc,
        @organization_id ,
		@time_period_id,
		legal_aid_url,
		adwords,
		swws_cms ,
		swws_cms_comment ,
		has_social_media ,
		automated_form_use ,
		automated_form_other ,
		automated_form_pro_se ,
		automated_form_staff_advocate ,
		automated_form_pro_bono ,
		automated_form_staff_must_use ,
		automated_form_most_freq ,
		automated_form_count ,
		automated_form_created_by_staff ,
		automated_form_created_by_law_student ,
		automated_form_created_by_pro_bono ,
		automated_form_created_by_contractor 
		FROM LSC_SOFTWARE_QUESTION 
		WHERE organization_id = @organization_id 
			AND time_period_id = @prev_time_period_id

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
			in_use ,
			percent_staff,
            organization_id ,
		    time_period_id)
			SELECT lsc_software_id, 
				lsc_software_product_id ,
				in_use ,
				percent_staff,
                organization_id ,
		        time_period_id
				FROM #sw

/**/print cast(@@rowcount as varchar(5)) + ' rows inserted into LSC_SOFTWARE'


		INSERT LSC_SOFTWARE_QUESTION 
			(lsc_software_question_id,
			dedicated_timekeeping_sw ,
			timekeeping_sw_name ,
			vpn ,
			swws_url ,
			swws_coord_name_first ,
			swws_coord_name_last ,
			swws_coord_phone ,
			swws_coord_email ,
			swws_financial_contribution ,
			swws_financial_contribution_amount ,
--			swws_content_contribution ,
--			swws_stakeholder_mtgs ,
--			swws_outreach ,
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
			swws_pro_bono ,
			a2j_author_use ,
			a2j_author_pro_se ,
			a2j_author_staff_pro_bono ,
			a2j_author_online_intake ,
			legal_research_desc,
            organization_id ,
		    time_period_id,
			legal_aid_url, 
			adwords,
			swws_cms ,
			swws_cms_comment ,
			has_social_media ,
			automated_form_use ,
			automated_form_other ,
			automated_form_pro_se ,
			automated_form_staff_advocate ,
			automated_form_pro_bono ,
			automated_form_staff_must_use ,
			automated_form_most_freq ,
			automated_form_count ,
			automated_form_created_by_staff ,
			automated_form_created_by_law_student ,
			automated_form_created_by_pro_bono ,
			automated_form_created_by_contractor ) 
			SELECT  lsc_software_question_id,
				dedicated_timekeeping_sw ,
				timekeeping_sw_name ,
				vpn ,
				swws_url ,
				swws_coord_name_first ,
				swws_coord_name_last ,
				swws_coord_phone ,
				swws_coord_email ,
				swws_financial_contribution ,
				swws_financial_contribution_amount ,
--				swws_content_contribution ,
--				swws_stakeholder_mtgs ,
--				swws_outreach ,
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
				swws_pro_bono ,
				a2j_author_use ,
				a2j_author_pro_se ,
				a2j_author_staff_pro_bono ,
				a2j_author_online_intake ,
				legal_research_desc,
                organization_id ,
		        time_period_id,
				legal_aid_url,
				adwords,
				swws_cms ,
				swws_cms_comment ,
				has_social_media ,
				automated_form_use ,
				automated_form_other ,
				automated_form_pro_se ,
				automated_form_staff_advocate ,
				automated_form_pro_bono ,
				automated_form_staff_must_use ,
				automated_form_most_freq ,
				automated_form_count ,
				automated_form_created_by_staff ,
				automated_form_created_by_law_student ,
				automated_form_created_by_pro_bono ,
				automated_form_created_by_contractor 
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
