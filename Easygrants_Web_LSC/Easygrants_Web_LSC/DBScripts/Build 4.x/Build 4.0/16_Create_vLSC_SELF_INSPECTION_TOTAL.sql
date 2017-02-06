CREATE VIEW vLSC_SELF_INSPECTION_TOTAL

AS

SELECT lsc_self_inspection_id,
	ISNULL(qcase1, 0) + ISNULL(qcase2, 0) + ISNULL(qcase3, 0) + ISNULL(qcase4, 0) + ISNULL(qcase5, 0) + ISNULL(qcase6, 0) 
		+ ISNULL(qcase7, 0) + ISNULL(qcase8, 0) + ISNULL(qcase9, 0) + ISNULL(qcase10, 0) + ISNULL(qcase11, 0) + ISNULL(qcase12, 0) qcase_total
	FROM LSC_SELF_INSPECTION

