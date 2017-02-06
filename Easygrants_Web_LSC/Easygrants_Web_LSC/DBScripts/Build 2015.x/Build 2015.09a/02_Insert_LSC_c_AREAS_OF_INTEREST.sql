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
		,'Projects to Move Organziations'
		,'Projects to Move Organizations Above the LSC Technology Baselines'
		,1
		,20)

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
		,'Technology Tools to Facilitate Access to Substantive Law Across Jurisdictions'
		,2
		,20)

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
		,'Automated Navigators'
		,'Automated Navigators for Pro Se Litigants'
		,3
		,20)


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
		,'Innovations'
		,'Innovations in Legal Information Design and Delivery'
		,4
		,20)

