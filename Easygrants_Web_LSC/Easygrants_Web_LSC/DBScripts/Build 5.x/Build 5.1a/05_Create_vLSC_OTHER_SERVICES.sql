/****** Object:  View [dbo].[vLSC_MATTERS]    Script Date: 04/16/2009 12:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_OTHER_SERVICES]

AS

SELECT o.legacy_organization_id Org_ID,
	tp.sort_order Year,
	ISNULL(os.IA1a, 0) IA1a,
	ISNULL(os.IA1b, 0) IA1b,
	ISNULL(os.IA2a, 0) IA2a,
	ISNULL(os.IA2b, 0) IA2b,
	ISNULL(os.IA3a, 0) IA3a,
	ISNULL(os.IA3b, 0) IA3b,
	ISNULL(os.IA4a, 0) IA4a,
	ISNULL(os.IA4b, 0) IA4b,
	ISNULL(os.IA5a, 0) IA5a,
	ISNULL(os.IA5b, 0) IA5b,
	ISNULL(os.IA6a, 0) IA6a,
	ISNULL(os.IA6b, 0) IA6b,
	ISNULL(os.IB1, 0) IB1, 
	ISNULL(os.IB2, 0) IB2,
	ISNULL(os.IB3, 0) IB3,
	ISNULL(os.IB4, 0) IB4,
	ISNULL(os.IB5, 0) IB5,
	ISNULL(os.IB6, 0) IB6,
	ISNULL(os.IB7, 0) IB7,
	ISNULL(os.IB8, 0) IB8,
	ISNULL(os.IB9, 0) IB9,
	ISNULL(os.IB10, 0) IB10,
	ISNULL(os.IC1, 0) IC1,
	ISNULL(os.IC2, 0) IC2,
	ISNULL(os.IC3, 0) IC3,
	ISNULL(os.IIA1a, 0) IIA1a,
	ISNULL(os.IIA1b, 0) IIA1b,
	ISNULL(os.IIA2a, 0) IIA2a,
	ISNULL(os.IIA2b, 0) IIA2b,
	ISNULL(os.IIA3a, 0) IIA3a,
	ISNULL(os.IIA3b, 0) IIA3b,
	ISNULL(os.IIA4a, 0) IIA4a,
	ISNULL(os.IIA4b, 0) IIA4b, 
	ISNULL(os.IIA5a, 0) IIA5a,
	ISNULL(os.IIA5b, 0) IIA5b,
	ISNULL(os.IIA6a, 0) IIA6a,
	ISNULL(os.IIA6b, 0) IIA6b,
	ISNULL(os.IIB1, 0) IIB1,
	ISNULL(os.IIB2, 0) IIB2,
	ISNULL(os.IIB3, 0) IIB3,
	ISNULL(os.IIB4, 0) IIB4,
	ISNULL(os.IIB5, 0) IIB5,
	ISNULL(os.IIB6, 0) IIB6,
	ISNULL(os.IIB7, 0) IIB7, 
	ISNULL(os.IIB8, 0) IIB8,
	ISNULL(os.IIB9, 0) IIB9,
	ISNULL(os.IIB10, 0) IIB10,
	ISNULL(os.IIIA1a, 0) IIIA1a,
	ISNULL(os.IIIA1b, 0) IIIA1b,
	ISNULL(os.IIIA2a, 0) IIIA2a,
	ISNULL(os.IIIA2b, 0) IIIA2b,
	ISNULL(os.IIIA3a, 0) IIIA3a,
	ISNULL(os.IIIA3b, 0) IIIA3b,
	ISNULL(os.IIIA4a, 0) IIIA4a,
	ISNULL(os.IIIA4b, 0) IIIA4b,
	ISNULL(os.IIIB1, 0) IIIB1,
	ISNULL(os.IIIB2, 0) IIIB2,
	ISNULL(os.IIIB3, 0) IIIB3,
	ISNULL(os.IIIB4, 0) IIIB4,
	ISNULL(os.IIIB5, 0) IIIB5,
	ISNULL(os.IIIB6, 0) IIIB6,
	ISNULL(os.IIIB7, 0) IIIB7,
	ISNULL(os.IIIB8, 0) IIIB8,
	ISNULL(os.IIIB9, 0) IIIB9,
	ISNULL(os.IIIB10, 0) IIIB10,
	ISNULL(os.IIIB11, 0) IIIB11,
	ISNULL(os.IIIB12, 0) IIIB12,
	CASE WHEN os.IV1_Info = 1 THEN 'Y' ELSE '' END IV1_Info,
	CASE WHEN os.IV2_TV = 1 THEN 'Y' ELSE '' END IV2_TV,
	CASE WHEN os.IV3_Radio = 1 THEN 'Y' ELSE '' END IV3_Radio,
	CASE WHEN os.IV4_News = 1 THEN 'Y' ELSE '' END IV4_News,
	CASE WHEN os.IV5_Refer = 1 THEN 'Y' ELSE '' END IV5_Refer,
	CASE WHEN os.IV6_How = 1 THEN 'Y' ELSE '' END IV6_How,
	CASE WHEN os.IV7_Other = 1 THEN 'Y' ELSE '' END IV7_Other,
	CASE WHEN os.V1_Legal = 1 THEN 'Y' ELSE '' END V1_Legal,
	CASE WHEN os.V2_Collab = 1 THEN 'Y' ELSE '' END V2_Collab,
	CASE WHEN os.V3_Other = 1 THEN 'Y' ELSE '' END V3_Other,
	ISNULL(os.VIA1a, 0) VIA1a,
	ISNULL(os.VIA1b, 0) VIA1b,
	ISNULL(os.VIA2a, 0) VIA2a,
	ISNULL(os.VIA2b, 0) VIA2b,
	ISNULL(os.VIB1, 0) VIB1, 
	ISNULL(os.VIB2, 0) VIB2,
	ISNULL(os.VIB3, 0) VIB3,
	ISNULL(os.VIB4, 0) VIB4,
	ISNULL(os.VIB5, 0) VIB5,
	ISNULL(os.VIB6, 0) VIB6,
	ISNULL(os.VIB7, 0) VIB7,
	ISNULL(os.VIB8, 0) VIB8,
	ISNULL(os.VIB9, 0) VIB9,
	ISNULL(os.VIB10, 0) VIB10
	FROM LSC_OTHER_SERVICES os
		JOIN ORGANIZATION o ON os.organization_id = o.organization_id
		JOIN c_TIME_PERIOD tp ON os.time_period_id = tp.id
