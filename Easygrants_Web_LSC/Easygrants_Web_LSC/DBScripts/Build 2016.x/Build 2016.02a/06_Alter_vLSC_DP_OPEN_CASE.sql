ALTER VIEW [dbo].[vLSC_DP_OPEN_CASE]

AS

WITH up (lsc_open_case_id,
     lsc_pai_case_handler_type_id,  
	case_type, 
	cases)
AS
	(SELECT lsc_open_case_id, lsc_pai_case_handler_type_id, case_type, cases
		FROM 
		(SELECT lsc_open_case_id,
		    lsc_pai_case_handler_type_id, 
			con_fin AS Consumer, 
			Education, 
			Employment, 
			Family, 
			Juvenile, 
			Health, 
			Housing, 
			Income, 
			Individual AS [Individual Rights], 
			Misc
			FROM lsc_open_case) oc
				UNPIVOT
					(cases for case_type IN 
						(Consumer, 
						Education, 
						Employment, 
						Family, 
						Juvenile, 
						Health, 
						Housing, 
						Income, 
						[Individual Rights])) AS rslt
	)

	SELECT CAST(up.lsc_open_case_id AS VARCHAR(6)) + '_' + up.case_type lsc_grants_primary_key, 
		CAST(cwosy.grantee_project_id AS VARCHAR(6)) + '-' + CAST(cwosy.wfta_year AS VARCHAR(4)) grant_key,
		CASE cwosy.wf_task_id WHEN 13 THEN 'Non-PAI' WHEN 14 THEN 'PAI' END pai_non_pai,
		pcht.description pai_case_handler_type,
		up.case_type, 
		up.cases
	FROM up
			JOIN LSC_OPEN_CASE oc ON up.lsc_open_case_id = oc.lsc_open_case_id
			JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON oc.wf_task_assignment_id = cwosy.wf_task_assignment_id
			JOIN vLSC_DP_GRANT g ON CAST(cwosy.grantee_project_id AS VARCHAR(6)) + '-' + CAST(cwosy.wfta_year AS VARCHAR(4)) = g.primary_key
			LEFT JOIN LSC_c_PAI_CASE_HANDLER_TYPE pcht ON up.lsc_pai_case_handler_type_id = pcht.id
