---Check the Outcome IDs for task_id = 84 and 85 and edit accordingly before running on live system  


CREATE VIEW [dbo].[vLSC_WFTA_SUBGRANT_REVIEW_OPP_OUTCOME]

AS

SELECT 
wfta.wf_task_assignment_id,
wfta.wf_task_outcome_id, 
Case when wfta.wf_task_outcome_id in (184, 189) then  fullappr_comments end [fullappr_comments],
Case when wfta.wf_task_outcome_id in (184, 189) then  fullappr_recommend_reporting_reqs end [fullappr_recommend_reporting_reqs],
Case when wfta.wf_task_outcome_id in (184, 189) then  fullappr_report_info end [fullappr_report_info],
Case when wfta.wf_task_outcome_id in (184, 189) then  fullappr_report_interval_months end [fullappr_report_interval_months],
Case when wfta.wf_task_outcome_id in (184, 189) then  fullappr_report_due_date end [fullappr_report_due_date],
Case when wfta.wf_task_outcome_id in (185, 190) then  partappr_recommend_concerns end [partappr_recommend_concerns],
Case when wfta.wf_task_outcome_id in (185, 190) then  partappr_revised_start_date end [partappr_revised_start_date],
Case when wfta.wf_task_outcome_id in (185, 190) then  partappr_revised_end_date end [partappr_revised_end_date],
Case when wfta.wf_task_outcome_id in (185, 190) then  partappr_revised_subgrant_amount end [partappr_revised_subgrant_amount],
Case when wfta.wf_task_outcome_id in (185, 190) then  partappr_recommend_reporting_reqs end [partappr_recommend_reporting_reqs],
Case when wfta.wf_task_outcome_id in (185, 190) then  partappr_report_info end [partappr_report_info],
Case when wfta.wf_task_outcome_id in (185, 190) then  partappr_report_interval_months end [partappr_report_interval_months],
Case when wfta.wf_task_outcome_id in (185, 190) then  partappr_report_due_date end [partappr_report_due_date],
Case when wfta.wf_task_outcome_id in (185, 190) then  partappr_comments end [partappr_comments],
Case when wfta.wf_task_outcome_id in (186, 191) then  provappr_pending_item end [provappr_pending_item],
Case when wfta.wf_task_outcome_id in (186, 191) then  provappr_due_date end [provappr_due_date],
Case when wfta.wf_task_outcome_id in (186, 191) then  provappr_comments end [provappr_comments],
Case when wfta.wf_task_outcome_id in (187, 192) then  denial_reason end [denial_reason]

FROM wf_task_assignment wfta 
     join LSC_WFTA_SUBGRANT_REVIEW_OPP r on wfta.wf_task_assignment_id = r.wf_task_assignment_id
WHERE wfta.wf_task_id in (84, 85)