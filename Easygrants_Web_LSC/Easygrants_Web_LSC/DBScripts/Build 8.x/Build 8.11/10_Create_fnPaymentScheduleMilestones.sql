CREATE FUNCTION fnPaymentScheduleMilestones
	(@lsc_tig_proposed_payment_schedule_id int,
	@sep varchar(20))
	RETURNS VARCHAR(MAX)

AS
BEGIN
	DECLARE @first bit,
		@result varchar(max),
		@milestone_number int,
		@milestone varchar(max)

	SET @first = 1
	SET @result = ''

	DECLARE ms CURSOR FOR
		SELECT milestone_number,
			milestone
			FROM LSC_MILESTONE
			WHERE lsc_tig_proposed_payment_schedule_id = @lsc_tig_proposed_payment_schedule_id
			ORDER BY milestone_number

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
