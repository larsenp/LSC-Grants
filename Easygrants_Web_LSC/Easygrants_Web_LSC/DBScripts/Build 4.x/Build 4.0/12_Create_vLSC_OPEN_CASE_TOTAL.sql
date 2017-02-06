CREATE VIEW vLSC_OPEN_CASE_TOTAL

AS

SELECT lsc_open_case_id,
	ISNULL(con_fin, 0) + 
		ISNULL(education, 0) +
		ISNULL(employment, 0) +
		ISNULL(family, 0) +
		ISNULL(juvenile, 0) +
		ISNULL(health, 0) +
		ISNULL(housing, 0) +
		ISNULL(income, 0) +
		ISNULL(individual, 0) +
		ISNULL(misc, 0) total
	FROM LSC_OPEN_CASE