ALTER FUNCTION [dbo].[fnPaymentScheduleMilestones]
	(/***new parameter for payment_id***/
    @payment_id int,
	@lsc_tig_proposed_payment_schedule_id int,
	@sep varchar(20))
	RETURNS VARCHAR(MAX)

AS
BEGIN
	/***verify that payment_id is null or pps_id is null but not both. Return if this is not the case***/
	DECLARE @first bit,
		@result varchar(max),
		@milestone_number int,
		@milestone varchar(max)

	SET @first = 1
	SET @result = ''
IF @lsc_tig_proposed_payment_schedule_id is null
--if @lsc_tig_proposed_payment_schedule_id is null/***Correct the syntax of the "IF" structure***/
	/****Adjust this cursor to use payment table***/

	DECLARE ms CURSOR FOR
		SELECT milestone_number,
			milestone
			FROM LSC_MILESTONE
			WHERE payment_id = @payment_id
			ORDER BY milestone_number

ELSE
--else
	DECLARE ms CURSOR FOR
		SELECT milestone_number,
			milestone
			FROM LSC_MILESTONE
			WHERE lsc_tig_proposed_payment_schedule_id = @lsc_tig_proposed_payment_schedule_id
			ORDER BY milestone_number
--end if


	OPEN ms
	FETCH NEXT FROM ms INTO @milestone_number, @milestone

	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @first = 0
			SET @result = @result + @sep

		SET @result = @result + CAST(@milestone_number AS varchar(3)) + '. ' + @milestone
		SET @first = 0
		FETCH NEXT FROM ms INTO @milestone_number, @milestone
	END
	CLOSE ms
	DEALLOCATE ms

	RETURN @result
END
