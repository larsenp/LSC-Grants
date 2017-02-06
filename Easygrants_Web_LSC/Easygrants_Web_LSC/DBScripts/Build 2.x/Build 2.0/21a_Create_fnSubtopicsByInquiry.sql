CREATE FUNCTION dbo.fnSubtopicsByInquiry
	(@InquiryID INT)

	RETURNS VARCHAR(MAX)

AS
BEGIN
	DECLARE @First bit,
		@Letter VARCHAR(1),
		@Subtopic VARCHAR(MAX),
		@Result VARCHAR(MAX)

	SET @First = 1
	SET @Result = ''

	DECLARE subtopics CURSOR FOR 
		SELECT	abbr,
			[description]
			FROM	LSC_a_REVIEW_SUBTOPIC
			WHERE lsc_review_inquiry_id = @InquiryID
			ORDER BY abbr

	OPEN subtopics
	FETCH NEXT FROM subtopics into @Letter, @Subtopic

	WHILE @@FETCH_STATUS=0
	BEGIN
		IF @First = 0
			SET @Result = @Result + '<br>'
		SET @Result = @Result + @Letter + ') ' + @Subtopic
		SET @First = 0
		FETCH NEXT FROM subtopics into @Letter, @Subtopic
	END

	CLOSE subtopics
	DEALLOCATE subtopics

	RETURN @Result
END