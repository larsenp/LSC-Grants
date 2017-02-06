--Include internal review task assignments (wf_task_type_id = 7)
ALTER VIEW [dbo].[vLSC_TO_DO_LIST_TIG_REVIEW]

AS

WITH base (	wf_task_id ,
	wf_task_status_id ,
	review_cycle_stage_id ,
	review_committee_id,
	person_id ,
	start_date,
	open_date,
	due_date,
	close_date,
	end_date )
	AS (SELECT wfta.wf_task_id,
			MIN(wfta.wf_task_status_id) wf_task_status_id,
			wfta.review_cycle_stage_id,
			wfta.review_committee_id ,
			wfta.person_id,
			MIN(CASE WHEN wfta.start_date IS NULL THEN wfpt.start_date ELSE wfta.start_date END) start_date,
			MIN(CASE WHEN wfta.open_date IS NULL THEN wfpt.open_date ELSE wfta.open_date END) open_date,
			MIN(CASE WHEN wfta.due_date IS NULL THEN wfpt.due_date ELSE wfta.due_date END) due_date,
			MAX(CASE WHEN wfta.close_date IS NULL THEN wfpt.close_date ELSE wfta.close_date END) close_date,
			MAX(CASE WHEN wfta.end_date IS NULL THEN wfpt.end_date ELSE wfta.end_date END) end_date
			FROM WF_TASK_ASSIGNMENT wfta
				JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
				JOIN a_WF_TASK_STATUS wfts ON wfta.wf_task_status_id = wfts.id
				JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
				JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
				JOIN a_WF_PROJECT_TASK wfpt ON wft.id = wfpt.wf_task_id
					AND wfp.id = gp.wf_project_id
				JOIN a_COMPETITION c ON wfp.competition_id = c.id
			WHERE c.program_id = 2
				AND (wft.wf_task_type_id = 4 or wfta.wf_task_id = 62)
				AND wfta.wf_task_status_id < 3
			GROUP BY wfta.person_id,
				wfta.wf_task_id,
				wfpt.id,
				wfta.review_cycle_stage_id,
				wfta.review_committee_id)


SELECT CAST(base.wf_task_id AS VARCHAR(3)) + '_' + CAST(ISNULL(base.review_cycle_stage_id,0) AS VARCHAR(3)) + '_' + CAST(ISNULL(base.person_id, 0) AS VARCHAR(5)) lsc_to_do_list_tig_review_key,
	base.wf_task_id,
	wft.description wf_task,
	base.wf_task_status_id,
	wfts.description wf_task_status,
	base.review_cycle_stage_id,
	rcs.name review_cycle_stage,
	rc.description review_committee,
	base.person_id,
	base.start_date,
	base.open_date,
	base.due_date,
	base.close_date,
	base.end_date
	FROM base
		JOIN a_WF_TASK wft ON base.wf_task_id = wft.id
		JOIN a_WF_TASK_STATUS wfts ON base.wf_task_status_id = wfts.id
		LEFT JOIN REVIEW_CYCLE_STAGE rcs ON base.review_cycle_stage_id = rcs.review_cycle_stage_id
		LEFT JOIN a_REVIEW_COMMITTEE rc ON base.review_committee_id = rc.id
