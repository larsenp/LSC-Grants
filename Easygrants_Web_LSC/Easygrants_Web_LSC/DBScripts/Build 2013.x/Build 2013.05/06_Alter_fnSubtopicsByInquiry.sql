/****** Object:  UserDefinedFunction [dbo].[fnSubtopicsByInquiry]    Script Date: 03/18/2013 16:04:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[fnSubtopicsByInquiry]
	(@InquiryID INT
	,@Format varchar(50) = 'HTML')

	RETURNS VARCHAR(MAX)

AS
BEGIN
	DECLARE @First bit,
		@Letter VARCHAR(1),
		@Subtopic VARCHAR(MAX),
		@Result VARCHAR(MAX),
		@LineBreak VARCHAR(10)

	SET @First = 1
	SET @Result = ''
	IF @Format = 'text'
		SET @LineBreak = CHAR(10) + CHAR(13)
	ELSE
		SET @LineBreak = '<br>'

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
			SET @Result = @Result + @LineBreak
		SET @Result = @Result + @Letter + ') ' + @Subtopic
		SET @First = 0
		FETCH NEXT FROM subtopics into @Letter, @Subtopic
	END

	CLOSE subtopics
	DEALLOCATE subtopics

	RETURN @Result
END