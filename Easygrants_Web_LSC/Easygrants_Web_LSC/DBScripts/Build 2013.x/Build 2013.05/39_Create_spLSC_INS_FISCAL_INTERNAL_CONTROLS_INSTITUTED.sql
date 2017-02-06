CREATE PROCEDURE spLSC_INS_FISCAL_INTERNAL_CONTROLS_INSTITUTED
	(@lsc_comp_appl_fiscal_id INT)

AS

IF EXISTS 
	(SELECT lsc_fiscal_internal_controls_instituted_id
		FROM LSC_FISCAL_INTERNAL_CONTROLS_INSTITUTED
		WHERE lsc_comp_appl_fiscal_id = @lsc_comp_appl_fiscal_id)
	RETURN

CREATE TABLE #x(
	ident int identity(0,1),
	lsc_fiscal_internal_controls_instituted_id int ,
	lsc_comp_appl_fiscal_id int ,
	lsc_fiscal_internal_control_area_id int )

INSERT #x
	(lsc_comp_appl_fiscal_id ,
	lsc_fiscal_internal_control_area_id )
	SELECT @lsc_comp_appl_fiscal_id
		,id
		FROM LSC_c_FISCAL_INTERNAL_CONTROL_AREA

DECLARE @rowcount int, @first_id int

SELECT @rowcount = COUNT(*)
	FROM #x

EXEC @first_id = spGETID_RANGE_SEL
	@mode = 2
	,@count = @rowcount
    ,@table = 'LSC_FISCAL_INTERNAL_CONTROLS_INSTITUTED'

UPDATE #x
	SET lsc_fiscal_internal_controls_instituted_id = ident + @first_id

INSERT LSC_FISCAL_INTERNAL_CONTROLS_INSTITUTED
	(lsc_fiscal_internal_controls_instituted_id ,
	lsc_comp_appl_fiscal_id ,
	lsc_fiscal_internal_control_area_id )
	SELECT lsc_fiscal_internal_controls_instituted_id ,
		lsc_comp_appl_fiscal_id ,
		lsc_fiscal_internal_control_area_id 
		FROM #x
