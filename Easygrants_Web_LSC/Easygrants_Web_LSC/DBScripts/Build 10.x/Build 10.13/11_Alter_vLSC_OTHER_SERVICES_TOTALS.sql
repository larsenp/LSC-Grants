SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_OTHER_SERVICES_TOTALS]

AS

SELECT lsc_other_services_id,
	ISNULL(IA1a, 0) + ISNULL(IA1b, 0) IA1_total,
	ISNULL(IA2a, 0) + ISNULL(IA2b, 0) IA2_total,
	ISNULL(IA3a, 0) + ISNULL(IA3b, 0) IA3_total,
	ISNULL(IA3a_unique_visitors, 0) + ISNULL(IA3b_unique_visitors, 0) IA3_unique_visitors_total,
	ISNULL(IA4a, 0) + ISNULL(IA4b, 0) IA4_total,
	ISNULL(IA4a_downloads, 0) + ISNULL(IA4b_downloads, 0) IA4_downloads_total,
	ISNULL(IA5a, 0) + ISNULL(IA5b, 0) IA5_total,
	ISNULL(IA6a, 0) + ISNULL(IA6b, 0) IA6_total,
	ISNULL(IA1a, 0) + ISNULL(IA2a, 0) + ISNULL(IA3a, 0) + 
		ISNULL(IA3a_unique_visitors, 0) + ISNULL(IA4a, 0) + 
		ISNULL(IA4a_downloads, 0) + ISNULL(IA5a, 0) + ISNULL(IA6a, 0) IAa_total,
	ISNULL(IA1b, 0) + ISNULL(IA2b, 0) + ISNULL(IA3b, 0) + 
		ISNULL(IA3b_unique_visitors, 0) + ISNULL(IA4b, 0) + 
		ISNULL(IA4b_downloads, 0) + ISNULL(IA5b, 0) + ISNULL(IA6b, 0) IAb_total,
	ISNULL(IA1a, 0) + ISNULL(IA1b, 0) 
		+ ISNULL(IA2a, 0) + ISNULL(IA2b, 0) 
		+ ISNULL(IA3a, 0) + ISNULL(IA3b, 0)
		+ ISNULL(IA3a_unique_visitors, 0) + ISNULL(IA3b_unique_visitors, 0)
		+ ISNULL(IA4a, 0) + ISNULL(IA4b, 0) 
		+ ISNULL(IA4a_downloads, 0) + ISNULL(IA4b_downloads, 0)
		+ ISNULL(IA5a, 0) + ISNULL(IA5b, 0)
		+ ISNULL(IA6a, 0) + ISNULL(IA6b, 0) IA_total,
	ISNULL(IB1, 0) + ISNULL(IB2, 0) + ISNULL(IB3, 0) + ISNULL(IB4, 0) + ISNULL(IB5, 0)
		+ ISNULL(IB6, 0) + ISNULL(IB7, 0) + ISNULL(IB8, 0) + ISNULL(IB9, 0) + ISNULL(IB10, 0) IB_total,
	ISNULL(IC1, 0) + ISNULL(IC2, 0) + ISNULL(IC3, 0) IC_total,
	ISNULL(IIA1a, 0) + ISNULL(IIA1b, 0) IIA1_total,
	ISNULL(IIA2a, 0) + ISNULL(IIA2b, 0) IIA2_total,
	ISNULL(IIA3a, 0) + ISNULL(IIA3b, 0) IIA3_total,
	ISNULL(IIA4a, 0) + ISNULL(IIA4b, 0) IIA4_total,
	ISNULL(IIA4a_downloads, 0) + ISNULL(IIA4b_downloads, 0) IIA4_downloads_total,
	ISNULL(IIA5a, 0) + ISNULL(IIA5b, 0) IIA5_total,
	ISNULL(IIA6a, 0) + ISNULL(IIA6b, 0) IIA6_total,
	ISNULL(IIA1a, 0) + ISNULL(IIA2a, 0) + ISNULL(IIA3a, 0) + ISNULL(IIA4a, 0) + 
		ISNULL(IIA4a_downloads, 0) + ISNULL(IIA5a, 0) + ISNULL(IIA6a, 0) IIAa_total,
	ISNULL(IIA1b, 0) + ISNULL(IIA2b, 0) + ISNULL(IIA3b, 0) + ISNULL(IIA4b, 0) + 
		ISNULL(IIA4b_downloads, 0) + ISNULL(IIA5b, 0) + ISNULL(IIA6b, 0) IIAb_total,
	ISNULL(IIA1a, 0) + ISNULL(IIA1b, 0) 
		+ ISNULL(IIA2a, 0) + ISNULL(IIA2b, 0) 
		+ ISNULL(IIA3a, 0) + ISNULL(IIA3b, 0)
		+ ISNULL(IIA4a, 0) + ISNULL(IIA4b, 0) 
		+ ISNULL(IIA4a_downloads, 0) + ISNULL(IIA4b_downloads, 0)
		+ ISNULL(IIA5a, 0) + ISNULL(IIA5b, 0)
		+ ISNULL(IIA6a, 0) + ISNULL(IIA6b, 0) IIA_total,
	ISNULL(IIB1, 0) + ISNULL(IIB2, 0) + ISNULL(IIB3, 0) + ISNULL(IIB4, 0) + ISNULL(IIB5, 0)
		+ ISNULL(IIB6, 0) + ISNULL(IIB7, 0) + ISNULL(IIB8, 0) + ISNULL(IIB9, 0) + ISNULL(IIB10, 0) IIB_total,
	ISNULL(IIIA1a, 0) + ISNULL(IIIA1b, 0) IIIA1_total,
	ISNULL(IIIA2a, 0) + ISNULL(IIIA2b, 0) IIIA2_total,
	ISNULL(IIIA3a, 0) + ISNULL(IIIA3b, 0) IIIA3_total,
	ISNULL(IIIA4a, 0) + ISNULL(IIIA4b, 0) IIIA4_total,
	ISNULL(IIIA1a, 0) + ISNULL(IIIA2a, 0) + ISNULL(IIIA3a, 0) + ISNULL(IIIA4a, 0) IIIAa_total,
	ISNULL(IIIA1b, 0) + ISNULL(IIIA2b, 0) + ISNULL(IIIA3b, 0) + ISNULL(IIIA4b, 0) IIIAb_total,
	ISNULL(IIIA1a, 0) + ISNULL(IIIA1b, 0) 
		+ ISNULL(IIIA2a, 0) + ISNULL(IIIA2b, 0) 
		+ ISNULL(IIIA3a, 0) + ISNULL(IIIA3b, 0)
		+ ISNULL(IIIA4a, 0) + ISNULL(IIIA4b, 0) IIIA_total,
	ISNULL(IIIB1, 0) + ISNULL(IIIB2, 0) + ISNULL(IIIB3, 0) + ISNULL(IIIB4, 0) + ISNULL(IIIB5, 0)
		+ ISNULL(IIIB6, 0) + ISNULL(IIIB7, 0) + ISNULL(IIIB8, 0) + ISNULL(IIIB9, 0) + ISNULL(IIIB10, 0) + ISNULL(IIIB11, 0) + ISNULL(IIIB12, 0) IIIB_total,
	ISNULL(VIA1a, 0) + ISNULL(VIA1b, 0) VIA1_total,
	ISNULL(VIA2a, 0) + ISNULL(VIA2b, 0) VIA2_total,
	ISNULL(VIA1a, 0) + ISNULL(VIA2a, 0) VIAa_total,
	ISNULL(VIA1b, 0) + ISNULL(VIA2b, 0) VIAb_total,
	ISNULL(VIA1a, 0) + ISNULL(VIA1b, 0) 
		+ ISNULL(VIA2a, 0) + ISNULL(VIA2b, 0) VIA_total,
	ISNULL(VIB1, 0) + ISNULL(VIB2, 0) + ISNULL(VIB3, 0) + ISNULL(VIB4, 0) + ISNULL(VIB5, 0)
		+ ISNULL(VIB6, 0) + ISNULL(VIB7, 0) + ISNULL(VIB8, 0) + ISNULL(VIB9, 0) + ISNULL(VIB10, 0) VIB_total
	FROM LSC_OTHER_SERVICES
