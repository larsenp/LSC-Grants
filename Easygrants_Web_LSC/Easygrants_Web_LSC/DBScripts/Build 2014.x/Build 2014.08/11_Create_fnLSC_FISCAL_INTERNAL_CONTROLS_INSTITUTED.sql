CREATE FUNCTION [dbo].[fnLSC_FISCAL_INTERNAL_CONTROLS_INSTITUTED_SCORE]
	(@lsc_comp_appl_fiscal_id int)

RETURNS int

AS

BEGIN
	DECLARE @score int

	SELECT @score = 0.5*COUNT(*)
		FROM LSC_FISCAL_INTERNAL_CONTROLS_INSTITUTED
		WHERE lsc_comp_appl_fiscal_id = @lsc_comp_appl_fiscal_id
			AND lsc_fiscal_internal_control_area_id IS NOT NULL

	RETURN @score
END
