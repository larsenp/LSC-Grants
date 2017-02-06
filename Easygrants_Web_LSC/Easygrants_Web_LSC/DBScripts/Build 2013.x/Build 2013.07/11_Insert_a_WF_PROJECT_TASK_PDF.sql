CREATE TABLE #wfptp
	(ident int identity(0,1)
	,id int
	,wf_project_task_id int
	,report_output_definition_type_id int
	,final_pdf_report_key varchar(100)
	,description varchar(500)
	,generation_id int)

INSERT #wfptp
	(wf_project_task_id 
	,report_output_definition_type_id 
	,final_pdf_report_key 
	,description 
	,generation_id )
	SELECT wfpt.id
		,1
		,'1607Review_OPPStaff'
		,'Review 1607 Compliance Report - OPP Staff'
		,0
		FROM a_WF_PROJECT_TASK wfpt
			LEFT JOIN a_WF_PROJECT_TASK_PDF wfptp ON wfpt.id = wfptp.wf_project_task_id
		WHERE wfpt.wf_task_id = 91
			AND wfptp.id IS NULL

DECLARE @rowcount INT, @first_new_id INT

SELECT @rowcount = count(*) FROM #wfptp

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'a_WF_PROJECT_TASK_PDF', @count = @rowcount, @mode = 2

UPDATE #wfptp
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
		FROM #wfptp

SELECT * FROM #wfptp
DROP TABLE #wfptp

select * from report_output
	where Entity_ID=63280 and Definition_ID=67

select top 10 * from report_output
	order by report_output_id  desc

select * from pdqdirector4.dbo.task