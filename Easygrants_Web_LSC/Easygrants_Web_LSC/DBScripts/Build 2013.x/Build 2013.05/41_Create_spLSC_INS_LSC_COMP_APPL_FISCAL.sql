--Rows in LSC_COMP_APPL_FISCAL AND LSC_FISCAL_INTERNAL_CONTROLS_INSTITUTED must already exist in order for fiscal form to work.

CREATE PROCEDURE [dbo].[spLSC_INS_LSC_COMP_APPL_FISCAL]
	(@organization_id INT
	,@time_period_id INT)

AS

DECLARE @lsc_comp_appl_fiscal_id INT

SELECT @lsc_comp_appl_fiscal_id = lsc_comp_appl_fiscal_id
	FROM LSC_COMP_APPL_FISCAL
	WHERE organization_id = @organization_id
		AND time_period_id = @time_period_id

IF @lsc_comp_appl_fiscal_id IS NULL
BEGIN
	EXEC @lsc_comp_appl_fiscal_id = GETID_SEL
		@mode = 2
		,@table = 'LSC_COMP_APPL_FISCAL'

	INSERT LSC_COMP_APPL_FISCAL
		(lsc_comp_appl_fiscal_id
		,organization_id
		,time_period_id)
		VALUES
			(@lsc_comp_appl_fiscal_id
			,@organization_id
			,@time_period_id)
END --@lsc_comp_appl_fiscal_id IS NULL

EXEC spLSC_INS_FISCAL_INTERNAL_CONTROLS_INSTITUTED
	@lsc_comp_appl_fiscal_id = @lsc_comp_appl_fiscal_id
