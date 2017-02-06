--Deactivate old service areas
UPDATE LSC_a_SERVICE_AREA
	SET lsc_service_area_status_id = 2
	FROM LSC_a_SERVICE_AREA sa
		JOIN a_COMPETITION c ON sa.competition_id = c.id
	WHERE c.abbr in ('LA-1', 'LA-12', 'MAL', 'MAR', 'MKY', 'MLA', 'MMS', 'MTN', 'MTX')

DECLARE @c_id INT
	,@sa_id INT
	,@sp_id INT
	,@sat_id INT

--Create LA-13 service area
EXEC @c_id = getid_sel @table = 'a_COMPETITION'
	,@mode = 2

INSERT a_COMPETITION
	(id
	,abbr
	,description
	,program_id
	,short_name)
	VALUES
		(@c_id
		,'LA-13'
		,'LA-13'
		,1
		,'LA-13')

EXEC @sa_id = getid_sel @table = 'LSC_a_SERVICE_AREA'
	,@mode = 2

SELECT @sp_id = id
	FROM c_STATE_PROV sp
	WHERE abbr = 'LA'

SELECT @sat_id = id
	FROM LSC_c_SERVICE_AREA_TYPE
	WHERE abbr = 'BF'

INSERT LSC_a_SERVICE_AREA
	(lsc_service_area_id
	,competition_id
	,service_area_type_id
	,state_province_id
	,lsc_service_area_status_id)
	VALUES
		(@sa_id
		,@c_id
		,@sat_id
		,@sp_id
		,1)

--Create MSX-2 service area
EXEC @c_id = getid_sel @table = 'a_COMPETITION'
	,@mode = 2

INSERT a_COMPETITION
	(id
	,abbr
	,description
	,program_id
	,short_name)
	VALUES
		(@c_id
		,'MSX-2'
		,'MSX-2'
		,1
		,'MSX-2')

EXEC @sa_id = getid_sel @table = 'LSC_a_SERVICE_AREA'
	,@mode = 2

SELECT @sp_id = id
	FROM c_STATE_PROV sp
	WHERE abbr = 'TX'

SELECT @sat_id = id
	FROM LSC_c_SERVICE_AREA_TYPE
	WHERE abbr = 'MW'

INSERT LSC_a_SERVICE_AREA
	(lsc_service_area_id
	,competition_id
	,service_area_type_id
	,state_province_id
	,lsc_service_area_status_id)
	VALUES 
		(@sa_id
		,@c_id
		,@sat_id
		,@sp_id
		,1)
