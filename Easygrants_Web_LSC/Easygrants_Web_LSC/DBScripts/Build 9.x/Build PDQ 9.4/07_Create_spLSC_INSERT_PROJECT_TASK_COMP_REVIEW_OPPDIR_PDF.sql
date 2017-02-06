SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spLSC_INSERT_PROJECT_TASK_COMP_REVIEW_OPPDIR_PDF]
--Create association between project tasks and PDFs for Competition Review - OPP Dir tasks

AS


--Create temp table 
CREATE TABLE #pdf(
		ident int identity(0,1),
		id int ,
		wf_project_task_id int ,
		report_output_definition_type_id int ,
		final_pdf_report_key varchar(50) ,
		description varchar(100) ,
		generation_id bit )


--Populate temp table
INSERT #pdf
		(wf_project_task_id ,
		report_output_definition_type_id ,
		final_pdf_report_key ,
		description ,
		generation_id )
		SELECT 
            wfpt.id ,
			1,
			'CompAppOPPDirReview',
			'Comp App OPP Director Review',
			0
        FROM a_wf_project_task wfpt
			join a_wf_task wft on wfpt.wf_task_id = wft.id
            join a_wf_project awfp on wfpt.wf_project_id = awfp.id
        Where wft.id = 47 and
            awfp.time_period_id = 16

--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			

DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #pdf

	EXEC @first_new_id = spGETID_RANGE_SEL @table = 'a_WF_PROJECT_TASK_PDF', @count = @rowcount, @mode = 2

	UPDATE #pdf
		SET id = ident + @first_new_id

---Insertion into the actual data table.	
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







