/****** Object:  StoredProcedure [dbo].[spLSC_INSERT_RENEWAL_WFTA]    Script Date: 03/09/2012 16:48:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Filter out discontinued service areas

ALTER PROCEDURE [dbo].[spLSC_INSERT_RENEWAL_WFTA]
	(@time_period_id int,
	@start_date datetime = NULL,
	@open_date datetime = NULL,
	@due_date datetime = NULL,
	@close_date datetime = NULL,
	@end_date datetime = NULL,
	@start_date_postpqv datetime = NULL,
	@open_date_postpqv datetime = NULL,
	@due_date_postpqv datetime = NULL,
	@close_date_postpqv datetime = NULL)
--For "_postpqv" parameters, provide Schedule B dates.

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
			join a_competition c on wfp.competition_id = c.id
			join lsc_a_service_area sa on c.id = sa.competition_id
		where gp.grant_status_id = 1
			and wfpf.id is null --no funding cycle for current time period
			and c.program_id = 1
			and sa.lsc_service_area_status_id = 1

--For recent PQV recipients, change the assignment to post-PQV renewal application.
--This sets all post-PQV applications to Schedule B. Schedule C applications must be reset with a separate script.
UPDATE #wfta
	SET wf_task_id = 67,
		wf_task_outcome_id = 145,
		start_date = @start_date_postpqv,
		open_date = @open_date_postpqv,
		due_date = @due_date_postpqv,
		close_date = @close_date_postpqv
	FROM #wfta
		JOIN GRANTEE_PROJECT gp ON #wfta.grantee_project_id = gp.grantee_project_id
		JOIN vLSC_ORG_RECENT_PQV orp ON gp.primary_organization_id = orp.organization_id
	WHERE orp.has_recent_pqv = 1


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
