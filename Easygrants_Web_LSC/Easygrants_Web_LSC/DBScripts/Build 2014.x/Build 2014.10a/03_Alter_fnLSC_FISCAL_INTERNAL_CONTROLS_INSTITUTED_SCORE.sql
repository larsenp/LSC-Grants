ALTER FUNCTION [dbo].[fnLSC_FISCAL_INTERNAL_CONTROLS_INSTITUTED_SCORE]
	(@lsc_comp_appl_fiscal_id int)

RETURNS float

AS

BEGIN
	DECLARE @score float

	SELECT @score = 0.5*COUNT(*)
		FROM LSC_FISCAL_INTERNAL_CONTROLS_INSTITUTED
		WHERE lsc_comp_appl_fiscal_id = @lsc_comp_appl_fiscal_id
			AND is_instituted = 1

	RETURN @score
END
