/****** Object:  StoredProcedure [dbo].[spLSC_INSERT_PROJECT_TASKS]    Script Date: 02/08/2013 11:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spLSC_INSERT_PROJECT_TASKS]
	(@time_period_id int,
	@wf_task_id int,
	@start_date datetime,
	@open_date datetime,
	@due_date datetime,
	@close_date datetime,
	@end_date datetime)

AS

--Create temp table for new project tasks
CREATE TABLE #pt
	(id int,
	wf_project_id int,
	wf_task_id int,
	start_date datetime,
	open_date datetime,
	due_date datetime,
	close_date datetime,
	end_date datetime,
	sort_order int,
	description varchar(100),
	initial_project_task bit default 0,
	submitted_outcome_id int)

--Populate temp table
INSERT #pt (wf_project_id ,
	wf_task_id ,
	start_date ,
	open_date ,
	due_date ,
	close_date ,
	end_date ,
	sort_order ,
	description)
	select wfp.id wf_project_id, 
		@wf_task_id,
		@start_date, 
		@open_date,
		@due_date,
		@close_date,
		@end_date,
		wft.sort_order,
		wfp.description + ' ' + wft.description
		from a_wf_project wfp
			join lsc_a_service_area sa on wfp.competition_id = sa.competition_id
			join lsc_c_service_area_type sat on sa.service_area_type_id = sat.id
			join a_wf_task wft on wft.id = @wf_task_id
		where time_period_id = @time_period_id

--Delete entries for GAR PAI reporting forms in MW or NA service areas
DELETE #pt
	FROM #pt
		JOIN a_WF_TASK wft ON #pt.wf_task_id = wft.id
		JOIN LSC_a_WF_TASK lwft ON #pt.wf_task_id = lwft.wf_task_id
		JOIN a_WF_PROJECT wfp ON #pt.wf_project_id = wfp.id
		JOIN LSC_a_SERVICE_AREA sa ON wfp.competition_id = sa.competition_id
	WHERE wft.wf_task_type_id = 3
		AND lwft.is_pai = 1
		AND sa.service_area_type_id <> 1

--Delete project-task combinations already represented in the LSC Grants database
--This allows the stored procedure to be rerun if necessary to reflect changes in the list of service areas in competition.
DELETE #pt
	FROM #pt
		JOIN a_WF_PROJECT_TASK wfpt ON #pt.wf_project_id = wfpt.wf_project_id
			AND #pt.wf_task_id = wfpt.wf_task_id


--If the task is a NIC, it must be designated as the initial task
UPDATE #pt
	SET initial_project_task = 1
	WHERE wf_task_id = 1

--If the task is a competitive or renewal application, the submitted_outcome_id must be set
UPDATE #pt
	SET submitted_outcome_id = 6
	WHERE wf_task_id = 2

UPDATE #pt
	SET submitted_outcome_id = 8
	WHERE wf_task_id = 4

UPDATE #pt
	SET submitted_outcome_id = 136
	WHERE wf_task_id = 66

UPDATE #pt
	SET submitted_outcome_id = 146
	WHERE wf_task_id = 67

--Adding the identity column after all deletions have been made ensures that we get a contiguous list of 
--IDs for the insert. 
ALTER TABLE #pt
	ADD ident int identity (0,1)

--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			
DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #pt

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'a_WF_PROJECT_TASK', @count = @rowcount, @mode = 2

UPDATE #pt
	SET id = ident + @first_new_id

--Insert to database table
INSERT a_WF_PROJECT_TASK (id,
	wf_project_id ,
	wf_task_id ,
	start_date ,
	open_date ,
	due_date ,
	close_date ,
	end_date ,
	sort_order ,
	description,
	initial_project_task,
	submitted_outcome_id)
	SELECT id,
		wf_project_id ,
		wf_task_id ,
		start_date ,
		open_date ,
		due_date ,
		close_date ,
		end_date ,
		sort_order ,
		description,
		initial_project_task,
		submitted_outcome_id
		FROM #pt

--Create association between project tasks and PDFs for NIC or application tasks
IF @wf_task_id IN (1,2,4,5,6,9,12,47,52,56,57,66,67,68,69,72,74,75,83, 86, 87, 89)
BEGIN
	CREATE TABLE #pdf(
		ident int identity(0,1),
		id int ,
		wf_project_task_id int ,
		report_output_definition_type_id int ,
		final_pdf_report_key varchar(50) ,
		description varchar(100) ,
		generation_id bit,
		service_area_type_id int )

	INSERT #pdf
		(wf_project_task_id ,
		generation_id,
		service_area_type_id )
		SELECT #pt.id,
			0,
			sa.service_area_type_id
			FROM #pt
				---JOIN a_WF_PROJECT_TASK wfpt ON #pt.id = wfpt.id
				JOIN a_WF_PROJECT wfp ON #pt.wf_project_id = wfp.id
				JOIN LSC_a_SERVICE_AREA sa ON wfp.competition_id = sa.competition_id

	DECLARE @rptdeftype int, @rpt_key varchar(50), @desc varchar(100)

	IF @wf_task_id = 1
		UPDATE #pdf
			SET report_output_definition_type_id = 1
			, final_pdf_report_key = 'SNIC'
			, description = 'Notice of Intent to Compete'

	IF @wf_task_id = 2
		UPDATE #pdf
			SET report_output_definition_type_id = 1
			, final_pdf_report_key = 'Application'
			, description = 'Application'

	IF @wf_task_id = 4
		UPDATE #pdf
			SET report_output_definition_type_id = 1
			, final_pdf_report_key = 'Renewal'
			, description = 'Renewal Application'

    IF @wf_task_id = 5
	BEGIN
		UPDATE #pdf
			SET report_output_definition_type_id = 2
			, final_pdf_report_key = 'CompAppStaffReviewCSR'
			, description = 'Competition App Staff Review with CSR'
			WHERE service_area_type_id = 1

		UPDATE #pdf
			SET report_output_definition_type_id = 2
			, final_pdf_report_key = 'CompAppStaffReview'
			, description = 'Competition Staff Review without CSR'
			WHERE service_area_type_id in (2,3)
	END

    IF @wf_task_id = 6
		UPDATE #pdf
			SET report_output_definition_type_id = 2
			, final_pdf_report_key = 'RenewalAppStaffReview'
			, description = 'Renewal App Staff Review'

    IF @wf_task_id = 9
		UPDATE #pdf
			SET report_output_definition_type_id = 1
			, final_pdf_report_key = 'GARFormD3'
			, description = 'GAR Form D-3: Actual Support and Revenue'

    IF @wf_task_id = 12
		UPDATE #pdf
			SET report_output_definition_type_id = 1
			, final_pdf_report_key = 'GARFormG4'
			, description = 'GAR Form G-4: Client Age, Ethnicity and Gender'

    IF @wf_task_id = 47
		UPDATE #pdf
			SET report_output_definition_type_id = 2
			, final_pdf_report_key = 'CompAppOPPDirReview'
			, description = 'Comp App OPP Director Review'

    IF @wf_task_id = 52
		UPDATE #pdf
			SET report_output_definition_type_id = 2
			, final_pdf_report_key = 'RenewalAppOPPDirReview'
			, description = 'Renewal App OPP Director Review'

    IF @wf_task_id = 56
		UPDATE #pdf
			SET report_output_definition_type_id = 2
			, final_pdf_report_key = 'CompAppPresidentReview'
			, description = 'Comp App President Review'

    IF @wf_task_id = 57
		UPDATE #pdf
			SET report_output_definition_type_id = 2
			, final_pdf_report_key = 'RenewalAppPresidentReview'
			, description = 'Renewal App President Review'

	IF @wf_task_id = 66
		UPDATE #pdf
			SET report_output_definition_type_id = 1
			, final_pdf_report_key = 'PostPQVCompetitiveApplication'
			, description = 'Post-PQV Competitive Grant Application'

	IF @wf_task_id = 67
		UPDATE #pdf
			SET report_output_definition_type_id = 1
			, final_pdf_report_key = 'PostPQVRenewalApplication'
			, description = 'Post-PQV Grant Renewal Application'
    
	IF @wf_task_id = 68
		UPDATE #pdf
			SET report_output_definition_type_id = 2
			, final_pdf_report_key = 'PostPQVCompApp_StaffReview'
			, description = 'Post PQV Competition Staff Review'

	IF @wf_task_id = 69
		UPDATE #pdf
			SET report_output_definition_type_id = 2
			, final_pdf_report_key = 'PostPQVRenewApp_StaffReview'
			, description = 'Post PQV Renewal Staff Review'

	IF @wf_task_id = 72
		UPDATE #pdf
			SET report_output_definition_type_id = 1
			, final_pdf_report_key = 'RiskAssessment'
			, description = 'Risk Assessment'

    IF @wf_task_id = 74
		UPDATE #pdf
			SET report_output_definition_type_id = 2
			, final_pdf_report_key = 'CompApp_OCEDirReview'
			, description = 'Competition App OCE Director Review'
	
	IF @wf_task_id = 75
		UPDATE #pdf
			SET report_output_definition_type_id = 2
			, final_pdf_report_key = 'RenewalApp_OCEDirReview'
			, description = 'Renewal App OCE Director Review'

                 IF @wf_task_id = 83
		UPDATE #pdf
			SET report_output_definition_type_id = 2
			, final_pdf_report_key = 'CompApp_OCEStaffReview'
			, description = 'Competition App OCE Staff Review'

	IF @wf_task_id = 86
		UPDATE #pdf
			SET report_output_definition_type_id = 2
			, final_pdf_report_key = 'CompApp_VicePresidentReview'
			, description = 'Competition App Vice President Review'

    IF @wf_task_id = 87
		UPDATE #pdf
			SET report_output_definition_type_id = 2
			, final_pdf_report_key = 'RenewalApp_VicePresidentReview'
			, description = 'Renewal App Vice President Review'

	IF @wf_task_id = 89
		UPDATE #pdf
			SET report_output_definition_type_id = 1
			, final_pdf_report_key = '1607ComplianceReport'
			, description = '1607 Compliance Report'

	--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			
	SELECT @rowcount = count(*) FROM #pdf

	EXEC @first_new_id = spGETID_RANGE_SEL @table = 'a_WF_PROJECT_TASK_PDF', @count = @rowcount, @mode = 2

	UPDATE #pdf
		SET id = ident + @first_new_id

	INSERT a_WF_PROJECT_TASK_PDF
		(id,
		wf_project_task_id ,
		report_output_definition_type_id ,
		final_pdf_report_key ,
		description ,
		generation_id )
		SELECT id,
			wf_project_task_id ,
			report_output_definition_type_id ,
			final_pdf_report_key ,
			description ,
			generation_id
			FROM #pdf

END --IF @wf_task_id IN (1,2,4,5,6,9,12,47,52,56,57,66,67,68,69,72,74,75,83, 86, 87,89)

IF @wf_task_id = 3
BEGIN
	--Add NIC review project tasks to workgroup definition
	CREATE TABLE #wg
		(ident int identity(0,1),
		id int ,
		description varchar(50) ,
		work_group_id int ,
		wf_project_id int ,
		wf_task_id int ,
		wf_status_id int ,
		wf_outcome_id int )

	INSERT #wg
		(description,
		work_group_id ,
		wf_project_id ,
		wf_task_id ,
		wf_status_id  )
		SELECT substring(description, 1, 50),
			2,
			wf_project_id,
			wf_task_id,
			1 
			FROM #pt

	--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			
	SELECT @rowcount = count(*) FROM #wg

	EXEC @first_new_id = spGETID_RANGE_SEL @table = 'a_WORK_GROUP_TASK_LIST', @count = @rowcount, @mode = 2

	UPDATE #wg
		SET id = ident + @first_new_id

	INSERT a_WORK_GROUP_TASK_LIST
		(id
		,description
		,work_group_id
		,wf_project_id
		,wf_task_id
		,wf_status_id
		,wf_outcome_id)
		SELECT id
			,description
			,work_group_id
			,wf_project_id
			,wf_task_id
			,wf_status_id
			,wf_outcome_id
			FROM #wg
END --IF @wf_task_id = 3
