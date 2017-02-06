DECLARE @new_id INT
EXEC @new_id  = getid_sel 
	@table = 'LSC_c_AREAS_OF_INTEREST'
	,@mode = 2

INSERT LSC_c_AREAS_OF_INTEREST
	(id
	,abbr
	,description
	,sort_order
	,time_period_id)
	VALUES
		(@new_id
		,'Key Initiatives'
		,'Key Initiatives from LSC''s 2012-2013 Summit on the Use of Technology to Expand Access to Justice'
		,1
		,19)

EXEC @new_id  = getid_sel 
	@table = 'LSC_c_AREAS_OF_INTEREST'
	,@mode = 2

INSERT LSC_c_AREAS_OF_INTEREST
	(id
	,abbr
	,description
	,sort_order
	,time_period_id)
	VALUES
		(@new_id
		,'Technology Tools'
		,'Technology Tools with Applicability to Federal Law'
		,2
		,19)

EXEC @new_id  = getid_sel 
	@table = 'LSC_c_AREAS_OF_INTEREST'
	,@mode = 2

INSERT LSC_c_AREAS_OF_INTEREST
	(id
	,abbr
	,description
	,sort_order
	,time_period_id)
	VALUES
		(@new_id
		,'Does Not Address'
		,'This technology project does not address a 2014 TIG area of interest.'
		,3
		,19)
