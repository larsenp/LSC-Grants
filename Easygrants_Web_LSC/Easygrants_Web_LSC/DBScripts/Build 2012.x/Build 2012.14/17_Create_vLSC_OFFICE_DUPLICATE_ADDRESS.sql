CREATE VIEW vLSC_OFFICE_DUPLICATE_ADDRESS

AS

SELECT MIN(lsc_office_id) lsc_office_id
	,organization_id
    ,time_period_id
    ,addr1_off
    ,addr2_off
    ,city_off
    ,state_province_id_off
    ,zip_off 
    ,MIN(off_id) off_id_min
    ,MAX(off_id) off_id_max
    ,COUNT(*) duplicate_count
    FROM LSC_OFFICE
    GROUP BY organization_id
        ,time_period_id
        ,addr1_off
        ,addr2_off
        ,city_off
        ,state_province_id_off
        ,zip_off 
    HAVING COUNT(*) > 1 