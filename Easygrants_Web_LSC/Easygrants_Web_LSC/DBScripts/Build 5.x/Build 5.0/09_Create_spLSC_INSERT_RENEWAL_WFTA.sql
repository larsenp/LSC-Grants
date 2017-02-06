/****** Object:  StoredProcedure [dbo].[spLSC_INSERT_RENEWAL_WFTA]    Script Date: 03/16/2009 09:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLSC_INSERT_RENEWAL_WFTA]
	(@time_period_id int,
	@start_date datetime = NULL,
	@open_date datetime = NULL,
	@due_date datetime = NULL,
	@close_date datetime = NULL,
	@end_date datetime = NULL)

AS

CREATE TABLE #wfta
	(ident int identity(0,1),
	wf_task_assignment_id int,
	wf_task_id int,
	wf_task_status_id int,
	wf_task_outcome_id int,
	grantee_project_id int,
	person_id int,
	wf_task_role_id int,
	start_date datetime,
	open_date datetime,
	due_date datetime,
	close_date datetime,
	end_date datetime,
	award_term_id int)

INSERT #wfta
	(wf_task_id,
	wf_task_status_id ,
	wf_task_outcome_id ,
	grantee_project_id ,
	person_id ,
	wf_task_role_id ,
	start_date,
	open_date ,
	due_date ,
	close_date ,
	end_date,
	award_term_id )
	select 4 ,
		1 ,
		7 ,
		gp.grantee_project_id,
		gp.primary_person_id ,
		1 ,
		@start_date,
		@open_date,
		@due_date,
		@close_date,
		@end_date,
		tp_curr.sort_order - tp_award.sort_order + 1 
		from grantee_project gp
			join a_wf_project wfp on gp.wf_project_id = wfp.id
			left join a_wf_project_task wfpt on wfp.id = wfpt.wf_project_id
				and wfpt.wf_task_id = 4
			left join a_wf_project wfpf on wfp.competition_id = wfpf.competition_id
				and wfpf.time_period_id = @time_period_id
			join c_time_period tp_award on wfp.time_period_id = tp_award.id
			join c_time_period tp_curr on tp_curr.id = @time_period_id
		where gp.grant_status_id = 1
			and wfpf.id is null --no funding cycle for current time period

--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.

DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #wfta

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'WF_TASK_ASSIGNMENT', @count = @rowcount, @mode = 2

UPDATE #wfta
	SET wf_task_assignment_id = ident + @first_new_id

INSERT WF_TASK_ASSIGNMENT
	(wf_task_assignment_id,
	wf_task_id,
	wf_task_status_id ,
	wf_task_outcome_id ,
	grantee_project_id ,
	person_id ,
	wf_task_role_id ,
	start_date,
	open_date ,
	due_date ,
	close_date ,
	end_date,
	award_term_id )
	SELECT wf_task_assignment_id,
		wf_task_id,
		wf_task_status_id ,
		wf_task_outcome_id ,
		grantee_project_id ,
		person_id ,
		wf_task_role_id ,
		start_date,
		open_date ,
		due_date ,
		close_date ,
		end_date,
		award_term_id 
		FROM #wfta

SELECT * FROM #wfta
