--Set initial_project_task flag when adding NIC project tasks

/****** Object:  StoredProcedure [dbo].[spLSC_INSERT_PROJECT_TASKS]    Script Date: 04/01/2010 10:15:15 ******/
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
	(ident int identity (0,1),
	id int,
	wf_project_id int,
	wf_task_id int,
	start_date datetime,
	open_date datetime,
	due_date datetime,
	close_date datetime,
	end_date datetime,
	sort_order int,
	description varchar(100),
	initial_project_task bit default 0)

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

--If the task is a NIC, it must be designated as the initial task
UPDATE #pt
	SET initial_project_task = 1
	WHERE wf_task_id = 1

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
	initial_project_task)
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
		initial_project_task
		FROM #pt

--Create association between project tasks and PDFs for NIC or application tasks
IF @wf_task_id IN (1,2,4)
BEGIN
	CREATE TABLE #pdf(
		ident int identity(0,1),
		id int ,
		wf_project_task_id int ,
		report_output_definition_type_id int ,
		final_pdf_report_key varchar(50) ,
		description varchar(100) ,
		generation_id bit )

	DECLARE @rpt_key varchar(50), @desc varchar(100)

	IF @wf_task_id = 1
	BEGIN
		SET @rpt_key = 'SNIC'
		SET @desc = 'Notice of Intent to Compete'
	END

	IF @wf_task_id = 2
	BEGIN
		SET @rpt_key = 'Application'
		SET @desc = 'Application'
	END

	IF @wf_task_id = 4
	BEGIN
		SET @rpt_key = 'Renewal'
		SET @desc = 'Renewal Application'
	END

	INSERT #pdf
		(wf_project_task_id ,
		report_output_definition_type_id ,
		final_pdf_report_key ,
		description ,
		generation_id )
		SELECT id,
			1,
			@rpt_key,
			@desc,
			0
			FROM #pt

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

END --IF @wf_task_id IN (1,2,4)

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

