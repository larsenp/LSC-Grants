CREATE FUNCTION [dbo].[fnLSC_FISCAL_SW_MODULES_INSTALLED_SCORE]
	(@lsc_comp_appl_fiscal_id int)

RETURNS int

AS

BEGIN
	DECLARE @score int

	SELECT @score = 0.5*COUNT(*)
		FROM LSC_FISCAL_SW_MODULES_INSTALLED
		WHERE lsc_comp_appl_fiscal_id = @lsc_comp_appl_fiscal_id
			AND lsc_fiscal_sw_module_id IS NOT NULL

	RETURN @score
END
