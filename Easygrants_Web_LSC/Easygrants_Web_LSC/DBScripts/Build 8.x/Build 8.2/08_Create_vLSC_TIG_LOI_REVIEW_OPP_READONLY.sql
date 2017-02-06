CREATE VIEW vLSC_TIG_LOI_REVIEW_OPP_READONLY

AS

SELECT [lsc_tig_loi_review_opp_id]
,[wf_task_assignment_id]
,dbo.fnCRLF_to_br([project_description_comment]) project_description_comment
,dbo.fnCRLF_to_br([benefits_comment]) benefits_comment
,dbo.fnCRLF_to_br([costs_comment]) costs_comment
,dbo.fnCRLF_to_br([partners_comment]) partners_comment
,dbo.fnCRLF_to_br([innovation_comment]) innovation_comment
,[tig_reporting_current]
,[statewide_grant_recipient]
,[next_milestone_expected]
FROM [LSC_TIG_LOI_REVIEW_OPP]

