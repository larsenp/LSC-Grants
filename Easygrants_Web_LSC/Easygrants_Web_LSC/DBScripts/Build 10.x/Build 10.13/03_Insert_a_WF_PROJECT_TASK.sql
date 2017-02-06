--Insert a row into a_WF_PROJECT_TASK for Form G-2 for each active service area

CREATE TABLE #a(
	[ident] int IDENTITY(0,1),
	[id] [int] NULL,
	[wf_project_id] [int] NOT NULL,
	[wf_task_id] [int] NOT NULL,
	[start_date] [datetime] NULL,
	[open_date] [datetime] NULL,
	[due_date] [datetime] NULL,
	[close_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[sort_order] [int] NULL,
	[description] [varchar](100) NULL,
	[generation_id] [tinyint] NULL,
	[initial_project_task] [bit] NULL)

INSERT #a
	(wf_project_id,
	wf_task_id,
	start_date,
	open_date,
	due_date,
	close_date,
	end_date,
	sort_order,
	description,
	generation_id,
	initial_project_task)
	SELECT wfp.id,
		76,
		'2011-12-1',
		'2011-12-1',
		'2012-3-1',
		'2012-4-1',
		'2012-12-31',
		76,
		wfp.description + ' ' + wft.description,
		1,
		0
		FROM grantee_project gp
			JOIN a_wf_project wfp ON gp.wf_project_id = wfp.id
			JOIN a_competition c ON wfp.competition_id = c.id
			JOIN a_WF_TASK wft ON wft.id = 76
		WHERE gp.grant_status_id = 1
			AND c.program_id = 1

DECLARE @first_id INT, @count INT

EXEC @first_id = spGETID_RANGE_SEL
	@table = 'a_WF_PROJECT_TASK',
	@mode = 2

UPDATE #a
	SET id = ident + @first_id

INSERT a_WF_PROJECT_TASK
	(id,
	wf_project_id,
	wf_task_id,
	start_date,
	open_date,
	due_date,
	close_date,
	end_date,
	sort_order,
	description,
	generation_id,
	initial_project_task)
	SELECT id,
		wf_project_id,
		wf_task_id,
		start_date,
		open_date,
		due_date,
		close_date,
		end_date,
		sort_order,
		description,
		generation_id,
		initial_project_task
		from #a

SELECT * FROM #a
DROP TABLE #a

