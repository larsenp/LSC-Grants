--Change definition of primary key field to improve performance
/****** Object:  View [dbo].[vLSC_CSR_BY_CATEGORY]    Script Date: 02/09/2011 15:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_CSR_BY_CATEGORY]

AS 

SELECT CAST(csr.wf_task_assignment_id AS VARCHAR(10)) + '_' + CAST(ct.lsc_case_category_id  AS VARCHAR(10)) id,
	csr.wf_task_assignment_id,
	ct.lsc_case_category_id,
	SUM(ISNULL(A,0)) A,
	SUM(ISNULL(B,0)) B,
	SUM(ISNULL(C,0)) C,
	SUM(ISNULL(D,0)) D,
	SUM(ISNULL(E,0)) E,
	SUM(ISNULL(F,0)) F,
	SUM(ISNULL(G,0)) G,
	SUM(ISNULL(H,0)) H,
	SUM(ISNULL(I,0)) I,
	SUM(ISNULL(Ia,0)) Ia,
	SUM(ISNULL(Ib,0)) Ib,
	SUM(ISNULL(Ic,0)) Ic,
	SUM(ISNULL(J,0)) J,
	SUM(ISNULL(K,0)) K,
	SUM(ISNULL(L,0)) L,
	SUM(ISNULL(csrt.total,0)) total
	FROM lsc_csr csr
		JOIN lsc_c_case_type ct ON csr.lsc_case_type_id = ct.id
		JOIN vLSC_CSR_TOTAL csrt ON csr.lsc_csr_id = csrt.lsc_csr_id
	GROUP BY csr.wf_task_assignment_id,
		ct.lsc_case_category_id