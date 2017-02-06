CREATE FUNCTION fnLSC_FRP_FISCAL_QUALIFICATION_SCORE
	(@lsc_comp_appl_fiscal_id int)

RETURNS int

AS

BEGIN
	DECLARE @count int

	SELECT @count = COUNT(*)
		FROM LSC_FRP_FISCAL_QUALIFICATION
		WHERE lsc_comp_appl_fiscal_id = @lsc_comp_appl_fiscal_id

	RETURN @count
END
