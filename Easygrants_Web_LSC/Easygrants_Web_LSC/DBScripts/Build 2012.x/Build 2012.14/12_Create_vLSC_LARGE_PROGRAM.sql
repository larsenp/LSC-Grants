CREATE VIEW vLSC_LARGE_PROGRAM

AS

SELECT o.organization_id
	,o.legacy_organization_id
	,o.organization_name
	,csc.total current_staff
	,coc.total current_offices
	,CASE WHEN csc.total > 100 OR coc.total > 10 THEN 1 ELSE 0 END is_large_program
	FROM ORGANIZATION o
		JOIN vLSC_CURRENT_STAFF_COUNT csc on o.organization_id = csc.organization_id
		JOIN vLSC_CURRENT_OFFICE_COUNT coc on o.organization_id = coc.organization_id