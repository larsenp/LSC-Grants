--This script has already been run in production and does not need to be run as part of a build.
--The purpose of this script is to configure PDFs for the Wyoming service areas in late competition for 2009.

EXEC spupdate_idgen

CREATE TABLE #pdf
	(ident INT IDENTITY (0,1),
	id INT,
	wf_project_task_id INT,
	wf_task_id INT)

INSERT #pdf
	(wf_project_task_id,
	wf_task_id)
	SELECT wfpt.id,
		wfpt.wf_task_id
		FROM a_wf_project wfp
			JOIN a_wf_project_task wfpt ON wfp.id = wfpt.wf_project_id
			LEFT JOIN a_wf_project_task_pdf wfptp ON wfpt.id = wfptp.wf_project_task_id
		WHERE wfpt.wf_task_id in  (1, 2)
			AND wfp.time_period_id = 4
			AND wfptp.id IS NULL

DECLARE @rowcount INT, @first_new_id INT

SELECT @rowcount = COUNT(*) FROM #pdf

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'a_wf_project_task_pdf', @count = @rowcount, @mode = 2

UPDATE #pdf
	SET id = ident + @first_new_id

INSERT a_WF_PROJECT_TASK_PDF
	(id,
	wf_project_task_id,
	report_output_definition_type_id,
	final_pdf_report_key,
	description,
	generation_id)
	SELECT id,
		wf_project_task_id,
		1,
		'SNIC',
		'Notice of Intent to Compete',
		0
		FROM #pdf
		WHERE wf_task_id = 1

INSERT a_WF_PROJECT_TASK_PDF
	(id,
	wf_project_task_id,
	report_output_definition_type_id,
	final_pdf_report_key,
	description,
	generation_id)
	SELECT id,
		wf_project_task_id,
		1,
		'Application',
		'Application',
		0
		FROM #pdf
		WHERE wf_task_id = 2

DROP TABLE #pdf
