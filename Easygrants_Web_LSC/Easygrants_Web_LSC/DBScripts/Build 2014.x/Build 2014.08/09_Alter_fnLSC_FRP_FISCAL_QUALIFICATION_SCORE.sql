ALTER FUNCTION [dbo].[fnLSC_FRP_FISCAL_QUALIFICATION_SCORE]
	(@lsc_comp_appl_fiscal_id int)

RETURNS int

AS

BEGIN
	DECLARE @score int

	SELECT @score = SUM
			(CASE WHEN lsc_fiscal_qualification_id = 1 THEN 2
				WHEN lsc_fiscal_qualification_id = 7 THEN 0
				WHEN lsc_fiscal_qualification_id IN (2,3,4) THEN 1 END)
		FROM LSC_FRP_FISCAL_QUALIFICATION
		WHERE lsc_comp_appl_fiscal_id = @lsc_comp_appl_fiscal_id

	RETURN @score
END

