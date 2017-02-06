
ALTER PROCEDURE [dbo].[spLSC_XFER_TIG_CONTRACTS_TO_WFTA]
	(@wf_task_assignment_id INT)

AS

DECLARE @grantee_project_id INT,
	@new_id INT,
	@row_count INT

SELECT @grantee_project_id = grantee_project_id
	FROM WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @wf_task_assignment_id

DELETE LSC_TIG_CONTRACT
	WHERE wf_task_assignment_id = @wf_task_assignment_id

CREATE TABLE #c(
	ident int IDENTITY(0,1),
	[wf_task_assignment_id] [int] NULL,
	[lsc_tig_contract_id] [int] NULL,
	[contracting_entity] [varchar](200) NULL,
	[tig_contract_entity_type_id] [int] NULL,
	[contract_amount_tig] [int] NULL,
	[contract_amount_other] [int] NULL,
	[contractor_staff_name_first] [varchar](50) NULL,
	[contractor_staff_name_last] [varchar](50) NULL,
	[project_role] [varchar](100) NULL,
	[tig_funded_tasks] [varchar](1000) NULL,
	[legal_content_activities] [bit] NULL,
	[legal_decision_activities] [bit] NULL,
	[legal_content_activity_comment] [varchar](max) NULL,
	[legal_decision_activity_comment] [varchar](max) NULL,
	[is_subgrant] [bit] NULL,
    [specific_contractor] [bit] NULL,
    [contractor_selection_process] [varchar](max) NULL,
    [oversight_methods] [varchar](max) NULL)

INSERT #c
	([wf_task_assignment_id],
	[contracting_entity],
	[tig_contract_entity_type_id],
	[contract_amount_tig],
	[contract_amount_other],
	[contractor_staff_name_first],
	[contractor_staff_name_last],
	[project_role],
	[tig_funded_tasks],
	[legal_content_activities],
	[legal_decision_activities],
	[legal_content_activity_comment],
	[legal_decision_activity_comment],
	[is_subgrant],
    [specific_contractor],
    [contractor_selection_process],
    [oversight_methods])
	SELECT @wf_task_assignment_id,
		[contracting_entity],
		[tig_contract_entity_type_id],
		[contract_amount_tig],
		[contract_amount_other],
		[contractor_staff_name_first],
		[contractor_staff_name_last],
		[project_role],
		[tig_funded_tasks],
		[legal_content_activities],
		[legal_decision_activities],
		[legal_content_activity_comment],
		[legal_decision_activity_comment],
		[is_subgrant],
        [specific_contractor],
		[contractor_selection_process],
		[oversight_methods]
		FROM LSC_TIG_CONTRACT
		WHERE grantee_project_id = @grantee_project_id

SELECT @row_count = COUNT(*) 
	FROM #c

EXEC @new_id = spGETID_RANGE_SEL 
	@table = 'LSC_TIG_CONTRACT',
	@count = @row_count,
	@mode = 2

UPDATE #c
	SET [lsc_tig_contract_id] = ident + @new_id

INSERT LSC_TIG_CONTRACT
	([wf_task_assignment_id],
	[lsc_tig_contract_id],
	[contracting_entity],
	[tig_contract_entity_type_id],
	[contract_amount_tig],
	[contract_amount_other],
	[contractor_staff_name_first],
	[contractor_staff_name_last],
	[project_role],
	[tig_funded_tasks],
	[legal_content_activities],
	[legal_decision_activities],
	[legal_content_activity_comment],
	[legal_decision_activity_comment],
	[is_subgrant],
    [specific_contractor],
    [contractor_selection_process],
    [oversight_methods])
	SELECT [wf_task_assignment_id],
		[lsc_tig_contract_id],
		[contracting_entity],
		[tig_contract_entity_type_id],
		[contract_amount_tig],
		[contract_amount_other],
		[contractor_staff_name_first],
		[contractor_staff_name_last],
		[project_role],
		[tig_funded_tasks],
		[legal_content_activities],
		[legal_decision_activities],
		[legal_content_activity_comment],
		[legal_decision_activity_comment],
		[is_subgrant],
        [specific_contractor],
		[contractor_selection_process],
		[oversight_methods]
		FROM #c



