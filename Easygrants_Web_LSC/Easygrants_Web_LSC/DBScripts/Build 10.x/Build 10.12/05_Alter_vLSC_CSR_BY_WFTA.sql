
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vLSC_CSR_BY_WFTA]

AS
SELECT wf_task_assignment_id,
	SUM(A) A,
	SUM(B) B,
	SUM(C) C,
	SUM(D) D,
	SUM(E) E,
	SUM(F) F,
	SUM(G) G,
	SUM(H) H,
	SUM(I) I,
	SUM(Ia) Ia,
	SUM(Ib) Ib,
	SUM(Ic) Ic,
	SUM(J) J,
	SUM(K) K,
	SUM(L) L,
	SUM(total) total,
    SUM(extended_cases) extended_cases,
    SUM(limited_cases) limited_cases,
    SUM(contested_cases) contested_cases
	FROM vLSC_CSR_BY_CATEGORY
	GROUP BY wf_task_assignment_id
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

