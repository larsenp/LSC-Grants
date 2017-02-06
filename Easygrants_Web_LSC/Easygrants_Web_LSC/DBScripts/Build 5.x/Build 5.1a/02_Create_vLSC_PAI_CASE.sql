/****** Object:  View [dbo].[vLSC_PAI_CASE]    Script Date: 04/16/2009 08:34:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_PAI_CASE]

AS

SELECT wfta.wf_task_assignment_id,
	o.legacy_organization_id OrgID,
	wcy.wfta_year YearID,
	c.abbr serv_area,
	rsa.ID ServiceAreaID,
	CASE WHEN wfta.wf_task_id = 15 THEN 'A' WHEN wfta.wf_task_id = 23 THEN 'P' END Record_Type,
	ISNULL(pc.Pro_Bono_CR, 0) Pro_Bono_CR,
	ISNULL(pc.Pro_Bono_S_CR, 0) Pro_Bono_S_CR,
	ISNULL(pc.Judicare_CR, 0) Judicare_CR,
	ISNULL(pc.Contr_Vol_CR, 0) Contr_Vol_CR,
	ISNULL(pc.Contr_Indv_CR, 0) Contr_Indv_CR,
	ISNULL(pc.Co_Council_CR, 0) Co_Council_CR,
	ISNULL(pc.LRS_CR, 0) LRS_CR,
	ISNULL(pc.Other_CR, 0) Other_CR,
	ISNULL(pc.Pro_Bono_CC, 0) Pro_Bono_CC,
	ISNULL(pc.Pro_Bono_S_CC, 0) Pro_Bono_S_CC,
	ISNULL(pc.Judicare_CC, 0) Judicare_CC,
	ISNULL(pc.Contr_Vol_CC, 0) Contr_Vol_CC,
	ISNULL(pc.Contr_Indv_CC, 0) Contr_Indv_CC,
	ISNULL(pc.Co_Council_CC, 0) Co_Council_CC,
	ISNULL(pc.LRS_CC, 0) LRS_CC,
	ISNULL(pc.Other_CC, 0) Other_CC,
	ISNULL(pc.Pro_Bono_AAR, 0) Pro_Bono_AAR,
	ISNULL(pc.Pro_Bono_S_AAR, 0) Pro_Bono_S_AAR,
	ISNULL(pc.Judicare_AAR, 0) Judicare_AAR,
	ISNULL(pc.Contr_Vol_AAR, 0) Contr_Vol_AAR,
	ISNULL(pc.Contr_Indv_AAR, 0) Contr_Indv_AAR,
	ISNULL(pc.Co_Council_AAR, 0) Co_Council_AAR,
	ISNULL(pc.LRS_AAR, 0) LRS_AAR,
	ISNULL(pc.Other_AAR, 0) Other_AAR,
	ISNULL(pc.Pro_Bono_AAP, 0) Pro_Bono_AAP,
	ISNULL(pc.Pro_Bono_S_AAP, 0) Pro_Bono_S_AAP,
	ISNULL(pc.Judicare_AAP, 0) Judicare_AAP,
	ISNULL(pc.Contr_Vol_AAP, 0) Contr_Vol_AAP,
	ISNULL(pc.Contr_Indv_AAP, 0) Contr_Indv_AAP,
	ISNULL(pc.Co_Council_AAP, 0) Co_Council_AAP,
	ISNULL(pc.LRS_AAP, 0) LRS_AAP,
	ISNULL(pc.Other_AAP, 0) Other_AAP
	FROM LSC_PAI_CASE pc
		JOIN WF_TASK_ASSIGNMENT wfta ON pc.wf_task_assignment_id = wfta.wf_task_assignment_id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN [LSC-SQL].RINDB.dbo.tblx_ServiceArea rsa ON c.abbr = rsa.Item
