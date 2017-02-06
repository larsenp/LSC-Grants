/****** Object:  UserDefinedFunction [dbo].[fnLSCWfTAReviewComments]    Script Date: 06/18/2009 10:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Peter Larsen
-- Create date: 6/18/2009
-- Description:	Given the ID of a review task assignment, returns a string containing all comments
--				made on inquiries for that task assignment
-- =============================================
CREATE FUNCTION [dbo].[fnLSCWfTAReviewComments]
(
	@wf_task_assignment_id int
)
RETURNS varchar(max)
AS
BEGIN
	
	DECLARE @Result varchar(max)

	DECLARE @comment varchar(max)

	DECLARE comments CURSOR FOR
		SELECT rai.comment
			FROM WF_TASK_ASSIGNMENT wfta
				JOIN LSC_REVIEW_ASSIGNMENT_INQUIRY rai ON wfta.wf_task_assignment_id = rai.wf_task_assignment_id
				JOIN LSC_a_REVIEW_INQUIRY i ON rai.lsc_review_inquiry_id = i.id
				JOIN LSC_a_REVIEW_CRITERION c ON i.lsc_review_criterion_id = c.id
				JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa ON c.lsc_review_performance_area_id = pa.id
			WHERE wfta.wf_task_assignment_id = @wf_task_assignment_id
				AND ISNULL(rai.comment, '') <> ''
			ORDER BY pa.sort_order, 
				c.abbr,
				i.sort_order

	OPEN comments
	FETCH NEXT FROM comments INTO @comment
	WHILE (@@FETCH_STATUS=0)
	BEGIN
		IF @Result IS NULL
			SET @Result = @comment
		ELSE
			SET @Result = @Result + char(10) + char(13) + char(10) + char(13) + @comment
		FETCH NEXT FROM comments INTO @comment
	END
	CLOSE comments
	DEALLOCATE comments

	RETURN @Result

END
