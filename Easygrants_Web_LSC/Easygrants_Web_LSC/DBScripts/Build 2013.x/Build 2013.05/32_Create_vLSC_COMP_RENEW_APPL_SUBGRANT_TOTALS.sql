CREATE VIEW vLSC_COMP_RENEW_APPL_SUBGRANT_TOTALS

AS

SELECT lsc_comp_renew_appl_subgrant_id
	,ISNULL(current_lsc_pai_subgrants_count, 0) + ISNULL(current_lsc_non_pai_subgrants_count, 0) current_lsc_subgrants_count
	,ISNULL(upcoming_lsc_pai_subgrants_count, 0) + ISNULL(upcoming_lsc_non_pai_subgrants_count, 0) upcoming_lsc_subgrants_count
	FROM LSC_COMP_RENEW_APPL_SUBGRANT