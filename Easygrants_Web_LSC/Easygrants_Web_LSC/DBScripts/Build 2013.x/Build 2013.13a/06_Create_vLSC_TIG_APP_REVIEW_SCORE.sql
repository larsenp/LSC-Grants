CREATE VIEW vLSC_TIG_APP_REVIEW_SCORE

AS

SELECT gp.legacy_grant_id tig
	,p.name_first reviewer_first
	,p.name_last reviewer_last
	,rat.description review_assignment_type
	,tr.data_entry_completed
	,wfts.description review_status
	,ars.budget_clear_link
	,ars.budget_adequate
	,ars.budget_reasonable_cost
	,ars.budget_narrative_supports
	,ars.budget_support_from_other
	,ars.need_clearly_described
	,ars.need_address_limitations
	,ars.need_demonstrate_relevance
	,ars.need_address_area_of_interest
	,ars.goals_clearly_articulated
	,ars.goals_identify_strategies
	,ars.goals_specify_evaluation
	,ars.partner_justice_community
	,ars.repl_common_problem
	,ars.repl_advantage_over_existing
	,ars.repl_ease
	,ars.repl_how_replicates
	,ars.repl_how_improves
	,ars.cap_team_members
	,ars.cap_organization
	,ars.past_tig
	,ars.sust_clear_strategy
	FROM LSC_TIG_APP_REVIEW_SCORE ars
		JOIN WF_TASK_ASSIGNMENT wfta ON ars.wf_task_assignment_id = wfta.wf_task_assignment_id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN PERSON p ON wfta.person_id = p.person_id
		JOIN a_WF_TASK_STATUS wfts ON wfta.wf_task_status_id = wfts.id
		LEFT JOIN c_REVIEW_ASSIGNMENT_TYPE rat ON wfta.review_assignment_type_id = rat.id
		LEFT JOIN LSC_TIG_REVIEW_OPEN_REP_WEB_IMPR tr ON wfta.wf_task_assignment_id = tr.wf_task_assignment_id
