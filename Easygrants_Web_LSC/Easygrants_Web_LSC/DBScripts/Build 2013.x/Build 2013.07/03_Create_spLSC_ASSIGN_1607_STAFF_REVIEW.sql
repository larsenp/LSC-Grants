CREATE PROCEDURE [dbo].[spLSC_ASSIGN_1607_STAFF_REVIEW]
	@time_period_id int

AS

CREATE TABLE #wfta(
	ident int identity(0,1),
	[wf_task_assignment_id] [int] ,
	[wf_task_id] [int] ,
	[wf_task_status_id] [int] ,
	[wf_task_outcome_id] [int] ,
	[grantee_project_id] [int] ,
	[person_id] [int] ,
	[wf_task_role_id] [int] ,
	[award_term_id] [int] ,
	[create_date] [datetime] )

INSERT #wfta
	([wf_task_id] ,
	[wf_task_status_id] ,
	[wf_task_outcome_id],
	[grantee_project_id],
	[person_id] ,
	[wf_task_role_id] ,
	[award_term_id] ,
	[create_date] )
	SELECT 91 
		,1 
		,208 
		,wfta_rpt.grantee_project_id
		,lsp.cr_reviewer_person_id 
		,7 wf_task_role_id
		,wfta_rpt.award_term_id
		,getdate() 
		FROM vwfta_competition_year wcy
			JOIN wf_task_assignment wfta_rpt on wcy.wf_task_assignment_id = wfta_rpt.wf_task_assignment_id
			JOIN grantee_project gp on wfta_rpt.grantee_project_id = gp.grantee_project_id
			JOIN organization o on gp.primary_organization_id = o.organization_id
			JOIN [address] a on o.organization_id = a.entity_id
				and a.entity_type_id = 2
				and a.is_primary = 1
			JOIN lsc_c_state_prov lsp on a.state_province_id = lsp.state_province_id
			LEFT JOIN wf_task_assignment wfta_rev on gp.grantee_project_id = wfta_rev.grantee_project_id
				and wfta_rev.wf_task_id = 91
			LEFT JOIN vLSC_BOARD_COUNTS bc ON o.organization_id = bc.organization_id
				AND wcy.time_period_id = bc.time_period_id
				AND bc.lsc_board_info_source_id = 3
			LEFT JOIN vLSC_BOARD_COMPLIANCE bcom ON bc.lsc_board_counts_id = bcom.lsc_board_counts_id
		WHERE wfta_rpt.wf_task_id = 89
			and wfta_rpt.wf_task_status_id = 2
			and wcy.time_period_id = @time_period_id 
			and wfta_rev.wf_task_assignment_id is null
			and bcom.overall_compliant = 0


DECLARE @rowcount int, @first_id int

SELECT @rowcount = COUNT(*)
	FROM #wfta

EXEC @first_id = spGETID_RANGE_SEL
	@mode = 2
	,@count = @rowcount
    ,@table = 'WF_TASK_ASSIGNMENT'

UPDATE #wfta
	SET wf_task_assignment_id = ident + @first_id

INSERT WF_TASK_ASSIGNMENT
	([wf_task_assignment_id],
	[wf_task_id] ,
	[wf_task_status_id] ,
	[wf_task_outcome_id],
	[grantee_project_id],
	[person_id] ,
	[wf_task_role_id] ,
	[award_term_id] ,
	[create_date] )
	SELECT 	[wf_task_assignment_id],
		[wf_task_id] ,
		[wf_task_status_id] ,
		[wf_task_outcome_id],
		[grantee_project_id],
		[person_id] ,
		[wf_task_role_id] ,
		[award_term_id] ,
		[create_date] 
		FROM #wfta
