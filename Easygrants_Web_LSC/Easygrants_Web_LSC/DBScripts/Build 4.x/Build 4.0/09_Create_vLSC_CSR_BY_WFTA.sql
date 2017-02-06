CREATE VIEW vLSC_CSR_BY_WFTA

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
	SUM(total) total
	FROM vLSC_CSR_BY_CATEGORY
	GROUP BY wf_task_assignment_id