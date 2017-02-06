CREATE FUNCTION [dbo].[fnCEO_COMPENSATION_JUSTIFICATION_SCORE]
	(@lsc_comp_appl_fiscal_id int)

RETURNS int

AS

BEGIN
	DECLARE @count int

	SELECT @count = COUNT(*)
		FROM LSC_CEO_COMPENSATION_JUSTIFICATION
		WHERE lsc_comp_appl_fiscal_id = @lsc_comp_appl_fiscal_id

	RETURN @count
END
