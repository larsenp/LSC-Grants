declare	@start_date datetime,
	@open_date datetime,
	@due_date datetime,
	@close_date datetime,
	@end_date datetime

set @start_date = '2012-6-15'
set @open_date = '2012-6-15'
set @due_date = '2012-8-1'
set @close_date = '2012-9-1'
set @end_date = '2012-9-1'

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
		wft.id,
		@start_date, 
		@open_date,
		@due_date,
		@close_date,
		@end_date,
		wft.sort_order,
		wfp.description + ' ' + wft.description
		from grantee_project gp
			join a_wf_project wfp on gp.wf_project_id = wfp.id
			join a_competition c on wfp.competition_id = c.id
			join lsc_a_service_area sa on wfp.competition_id = sa.competition_id
			join lsc_c_service_area_type sat on sa.service_area_type_id = sat.id
			join a_wf_task wft on wft.id in (78,79,80,81,82)
		where gp.grant_status_id = 1
			and c.program_id = 1

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

drop table #pt