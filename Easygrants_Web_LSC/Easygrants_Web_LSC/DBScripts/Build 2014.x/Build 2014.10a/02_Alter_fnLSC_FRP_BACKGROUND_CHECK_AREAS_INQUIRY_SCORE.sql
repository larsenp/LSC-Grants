ALTER FUNCTION [dbo].[fnLSC_FRP_BACKGROUND_CHECK_AREAS_INQUIRY_SCORE]
	(@lsc_comp_appl_fiscal_id int)

RETURNS float

AS

BEGIN
	DECLARE @score float

	SELECT @score = 0.5*COUNT(*)
		FROM LSC_FRP_BACKGROUND_CHECK_AREAS_INQUIRY
		WHERE lsc_comp_appl_fiscal_id = @lsc_comp_appl_fiscal_id
			AND lsc_frp_background_check_areas_inquiry_lkp_id IS NOT NULL

	RETURN @score
END

