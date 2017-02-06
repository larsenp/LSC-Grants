ALTER PROCEDURE [dbo].[spLSC_TIG_APPLY_CONFERENCE_FEE]
	(@tig varchar(6), 
    @con_fee int)

/*
This stored procedure applies a conference fee (specified as a parameter to the stored procedure)
to a TIG grant (specified by its TIG number as a parameter to the stored procedure).

The procedure assumes that the task assignments to TIG staff for Review Revised Budget and Review
Revised Payment Schedule are open. The data updates for budget and payment schedule are made to these
task assignments, not directly to the grant file.
*/
AS

DECLARE @grantee_project_id int,
    @gpi_id int,
    @budget_id int,
    @payment_id int,
    @new_id int,
	@effective_year varchar(4),
	@effective_month varchar(2),
	@effective_day varchar(2),
	@confee_budget_category_id int

SELECT @grantee_project_id = grantee_project_id
    FROM GRANTEE_PROJECT
    WHERE legacy_grant_id = @tig

--Populate grant file with conference fee
UPDATE LSC_GRANTEE_PROJECT_TIG
    SET con_fee = @con_fee
    WHERE grantee_project_id = @grantee_project_id

--Set actual grant award amount (recommended amount plus conference fee)
UPDATE GRANTEE_PROJECT_INFO
    SET award_amount = award_amount + @con_fee
    WHERE grantee_project_id = @grantee_project_id

--Insert row into GRANT_AWARD_AND_AMENDMENTS for award
EXEC @new_id = getid_sel @table='GRANT_AWARD_AND_AMENDMENTS', @mode = 2

--effective date must have no time part due to bug in function f_Update_Award_Amount
SET @effective_year = CAST(YEAR(GETDATE()) AS VARCHAR(4))
SET @effective_month = CAST(MONTH(GETDATE()) AS VARCHAR(2))
SET @effective_day = CAST(DAY(GETDATE()) AS VARCHAR(2))

INSERT GRANT_AWARD_AND_AMENDMENTS
    (id,
    grantee_project_id,
    effective_date,
    amendment_amount,
    comments,
    create_date)
    VALUES(@new_id,
        @grantee_project_id,
        CAST(@effective_year + '-' + @effective_month + '-' + @effective_day as DATETIME), 
        @con_fee,
        'TIG conference fee',
        getdate())

--Check for budget line for conference fee
SELECT @budget_id = tb.lsc_tig_budget_id
    FROM LSC_TIG_BUDGET tb
        JOIN WF_TASK_ASSIGNMENT wfta ON tb.wf_task_assignment_id = wfta.wf_task_assignment_id
    WHERE wfta.grantee_project_id = @grantee_project_id
        AND wfta.wf_task_id = 58

--Determine budget category ID for conference fee
SELECT @confee_budget_category_id = bc.budget_category_id
	FROM GRANTEE_PROJECT gp
		JOIN a_BUDGET_CATEGORY bc ON gp.wf_project_id = bc.project_id
	WHERE gp.grantee_project_id = @grantee_project_id
			AND bc.description = 'Conference Fee'

IF @budget_id IS NULL
	BEGIN

	--Add budget line for conference fee
	EXEC @new_id = getid_sel @table='LSC_TIG_BUDGET_ITEM', @mode = 2

	INSERT LSC_TIG_BUDGET_ITEM
    (lsc_tig_budget_item_id,
    lsc_tig_budget_id,
    budget_category_id,
    lsc_tig_budget_funding_type_id,
    amount,
    comment)
    VALUES(@new_id,
        @budget_id,
        @confee_budget_category_id,
        1,
        @con_fee,
        'Conference Fee')

	--Add additional zero-value budget lines for other funding types for conference fee (required in order for budget form to work)
	EXEC @new_id = getid_sel @table='LSC_TIG_BUDGET_ITEM', @mode = 2

	INSERT LSC_TIG_BUDGET_ITEM
    (lsc_tig_budget_item_id,
    lsc_tig_budget_id,
    budget_category_id,
    lsc_tig_budget_funding_type_id,
    amount)
    VALUES(@new_id,
        @budget_id,
        @confee_budget_category_id,
        2,
        0)

	EXEC @new_id = getid_sel @table='LSC_TIG_BUDGET_ITEM', @mode = 2

	INSERT LSC_TIG_BUDGET_ITEM
    (lsc_tig_budget_item_id,
    lsc_tig_budget_id,
    budget_category_id,
    lsc_tig_budget_funding_type_id,
    amount)
    VALUES(@new_id,
        @budget_id,
        @confee_budget_category_id,
        3,
        0)

	EXEC @new_id = getid_sel @table='LSC_TIG_BUDGET_ITEM', @mode = 2

	INSERT LSC_TIG_BUDGET_ITEM
    (lsc_tig_budget_item_id,
    lsc_tig_budget_id,
    budget_category_id,
    lsc_tig_budget_funding_type_id,
    amount)
    VALUES(@new_id,
        @budget_id,
        @confee_budget_category_id,
        4,
        0)
  END
ELSE
  BEGIN

   --Update the conference fee with amount provided by TIG Team
	UPDATE LSC_TIG_BUDGET_ITEM
		SET amount = @con_fee,
            comment = 'Conference Fee'
		WHERE lsc_tig_budget_id = @budget_id and budget_category_id = @confee_budget_category_id and lsc_tig_budget_funding_type_id = 1

	UPDATE LSC_TIG_BUDGET_ITEM
		SET amount = 0
		WHERE lsc_tig_budget_id = @budget_id and budget_category_id = @confee_budget_category_id and lsc_tig_budget_funding_type_id = 2

	UPDATE LSC_TIG_BUDGET_ITEM
		SET amount = 0
		WHERE lsc_tig_budget_id = @budget_id and budget_category_id = @confee_budget_category_id and lsc_tig_budget_funding_type_id = 3

	UPDATE LSC_TIG_BUDGET_ITEM
		SET amount = 0
		WHERE lsc_tig_budget_id = @budget_id and budget_category_id = @confee_budget_category_id and lsc_tig_budget_funding_type_id = 4

END

--Add conference fee amount to first payment
SELECT @payment_id = lsc_tig_proposed_payment_schedule_id
    FROM LSC_TIG_PROPOSED_PAYMENT_SCHEDULE pps
        JOIN WF_TASK_ASSIGNMENT wfta ON pps.wf_task_assignment_id = wfta.wf_task_assignment_id
    WHERE wfta.grantee_project_id = @grantee_project_id
        AND wfta.wf_task_id = 59
        AND pps.payment_number = 1

UPDATE LSC_TIG_PROPOSED_PAYMENT_SCHEDULE
    SET payment_amount = payment_amount + @con_fee
    WHERE lsc_tig_proposed_payment_schedule_id = @payment_id
