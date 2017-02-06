/****** Object:  View [dbo].[vLSC_GAR_ADDITIONAL_INFO_TOTALS]    Script Date: 10/05/2011 17:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_GAR_ADDITIONAL_INFO_TOTALS]

AS

SELECT gai.lsc_gar_additional_info_id,
	gai.wf_task_assignment_id,
	cwosy.recipient_id,
	cwosy.wfta_year,
	gai.adults_in_households,
	gai.children_in_households,
	ISNULL(gai.adults_in_households, 0) + ISNULL(gai.children_in_households, 0) total_persons_served,
	gai.domestic_violence_cases
	FROM LSC_GAR_ADDITIONAL_INFO gai
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON gai.wf_task_assignment_id = cwosy.wf_task_assignment_id
