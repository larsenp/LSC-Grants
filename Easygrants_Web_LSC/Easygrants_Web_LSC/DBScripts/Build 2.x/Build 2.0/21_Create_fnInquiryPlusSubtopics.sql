CREATE FUNCTION [dbo].[fnInquiryPlusSubtopics]
	(@InquiryID int)
	RETURNS varchar(max)
	AS

	BEGIN
		DECLARE @return varchar(max)
		DECLARE @abbr varchar(20)
		DECLARE @description varchar(200)
		
		SELECT @return = ISNULL(description, '')
			FROM LSC_a_REVIEW_INQUIRY
			WHERE id = @InquiryID

		DECLARE curSubtopics CURSOR FOR
			SELECT abbr, description
				FROM LSC_a_REVIEW_SUBTOPIC
				WHERE lsc_review_inquiry_id = @InquiryID
				ORDER BY abbr
		OPEN curSubtopics
		FETCH NEXT FROM curSubtopics INTO @abbr, @description
		
		WHILE (@@FETCH_STATUS = 0)
		BEGIN
			SET @return = @return + ' ' + @abbr + ') ' + @description 
			FETCH NEXT FROM curSubtopics INTO @abbr, @description
		END
		
		CLOSE curSubtopics
		DEALLOCATE curSubtopics
		
		RETURN @return
		

	END

