DELETE LSC_PROGRAM_VISIT
	WHERE lsc_program_visit_type_id = 2

UPDATE s_ID_GEN
	SET next_id = 1
	where table_name = 'LSC_PROGRAM_VISIT'

CREATE TABLE #lpv
    (ident int identity(0,1)
    ,lsc_program_visit_id int
    ,organization_id int
    ,lsc_internal_office_id int
    ,lsc_program_visit_type_id int
    ,visit_start_date datetime
    ,visit_end_date datetime
    ,is_early_year_pqv bit
    ,joint_visit bit
    ,notes varchar(max))

INSERT #lpv
    (organization_id
    ,lsc_internal_office_id 
    ,lsc_program_visit_type_id 
    ,visit_start_date 
    ,visit_end_date 
    ,is_early_year_pqv 
    ,joint_visit 
    ,notes)
    SELECT o.organization_id
        ,2
        ,pvt.id
        ,opv.visit_date
        ,opv.end_date
        ,opv.is_early_year_visit
        ,opv.joint_visit
        ,opv.notes
        FROM [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.OPP_PROGRAM_VISIT opv
            JOIN ORGANIZATION o ON opv.recipient_id = o.legacy_organization_id
            JOIN LSC_c_PROGRAM_VISIT_TYPE pvt ON opv.purpose = pvt.description

DECLARE @rowcount int, @first_id int

SELECT @rowcount = COUNT(*)
	FROM #lpv

EXEC @first_id = spGETID_RANGE_SEL
	@table = 'LSC_PROGRAM_VISIT',
	@count = @rowcount,
	@mode = 2

UPDATE #lpv
	SET lsc_program_visit_id = ident + @first_id

INSERT INTO [LSC_PROGRAM_VISIT]
           ([lsc_program_visit_id]
           ,[organization_id]
           ,[lsc_internal_office_id]
           ,[lsc_program_visit_type_id]
           ,[visit_start_date]
           ,[visit_end_date]
           ,[is_early_year_pqv]
           ,[joint_visit]
           ,[notes])
	SELECT  [lsc_program_visit_id]
           ,[organization_id]
           ,[lsc_internal_office_id]
           ,[lsc_program_visit_type_id]
           ,[visit_start_date]
           ,[visit_end_date]
           ,[is_early_year_pqv]
           ,[joint_visit]
           ,[notes]
		FROM #lpv

SELECT sp.abbr 
    ,o.organization_name
    ,o.legacy_organization_id
    ,pvt.description visit_type
    ,lpv.visit_start_date
    ,lpv.visit_end_date
    ,lpv.joint_visit
    ,lpv.notes
    ,lpv.is_early_year_pqv
    FROM LSC_PROGRAM_VISIT lpv
        JOIN ORGANIZATION o ON lpv.organization_id = o.organization_id
        JOIN ADDRESS a ON o.organization_id = a.entity_id
            AND a.entity_type_id = 2
            AND a.is_primary = 1
        JOIN c_STATE_PROV sp ON a.state_province_id = sp.id
        JOIN LSC_c_PROGRAM_VISIT_TYPE pvt ON lpv.lsc_program_visit_type_id = pvt.id
	order by o.legacy_organization_id, lpv.visit_start_date

select * from [lsc-egsql].grantee_profile_staff_overview.dbo.opp_program_visit
	order by recipient_id, visit_date

DROP TABLE #lpv


/*
select #lpv.*
    FROM #lpv
        JOIN ORGANIZATION o ON #lpv.organization_id = o.organization_id
        LEFT JOIN ADDRESS a ON o.organization_id = a.entity_id
            AND a.entity_type_id = 2
    WHERE a.address_id IS NULL

SELECT * FROM organization where organization_id = 1032

select * from lsc_program_visit


SELECT o.organization_id
    ,2
    ,pvt.id
    ,opv.visit_date
    ,opv.end_date
    ,opv.joint_visit
    ,opv.notes
    ,opv.is_early_year_visit
    FROM [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.OPP_PROGRAM_VISIT opv
        JOIN ORGANIZATION o ON opv.recipient_id = o.legacy_organization_id
        JOIN LSC_c_PROGRAM_VISIT_TYPE pvt ON opv.purpose = pvt.description

*/