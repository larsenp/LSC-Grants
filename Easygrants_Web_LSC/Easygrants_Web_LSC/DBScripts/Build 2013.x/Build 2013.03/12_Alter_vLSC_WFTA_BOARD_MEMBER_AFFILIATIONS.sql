SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_WFTA_BOARD_MEMBER_AFFILIATIONS]

AS

SELECT CAST(wftaa.id AS VARCHAR(10)) + '_' + CAST(wfta.wf_task_assignment_id AS VARCHAR(10)) lsc_wfta_board_member_affiliation_id,
	wfta.wf_task_assignment_id,
	wftaa.id lsc_wf_task_assignment_affiliation_id
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON wfta.wf_task_assignment_id = cwosy.wf_task_assignment_id
		JOIN LSC_a_WF_TASK lwft ON wfta.wf_task_id = lwft.wf_task_id
		JOIN LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS wftaa ON cwosy.organization_id = wftaa.organization_id
			AND cwosy.time_period_id = wftaa.time_period_id
			AND lwft.lsc_board_info_source_id = wftaa.lsc_board_info_source_id
	WHERE wfta.wf_task_id IN (1,2,4,66,67,89)


