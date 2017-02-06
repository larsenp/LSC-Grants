CREATE TABLE #ro
	(ident int identity(0,1),
	[report_output_id] [int] ,
	[entity_id] [int] ,
	[definition_id] [int] ,
	[gen_request_date] [datetime] ,
	[status] [int] )

INSERT #ro
	([entity_id],
	[definition_id],
	[gen_request_date],
	[status])
	SELECT wf_task_assignment_id 
		,76
		,DATEADD(d,1,GETDATE()) --set to tomorrow to give priority to requests coming from web app
		,0
		FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR
		WHERE wf_task_id = 102
			and wfta_year = 2017

DECLARE @first_new_id INT
	,@rowcount INT

SELECT @rowcount = COUNT(*)
	FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR
	WHERE wf_task_id = 102
		and wfta_year = 2017

EXEC @first_new_id = spGETID_RANGE_SEL
	@table = 'REPORT_OUTPUT'
	,@count = @rowcount

UPDATE #ro
	SET report_output_id = ident + @first_new_id

INSERT [REPORT_OUTPUT]
           ([report_output_id]
           ,[entity_id]
           ,[definition_id]
           ,[gen_request_date]
           ,[status])
     SELECT [report_output_id]
           ,[entity_id]
           ,[definition_id]
           ,[gen_request_date]
           ,[status]
		   FROM #ro

SELECT * FROM #ro
DROP TABLE #ro
