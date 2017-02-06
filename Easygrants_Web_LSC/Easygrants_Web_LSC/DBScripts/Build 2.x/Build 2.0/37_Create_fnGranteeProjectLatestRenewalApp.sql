/****** Object:  UserDefinedFunction [dbo].[fnGranteeProjectLatestRenewalApp]    Script Date: 06/05/2008 09:57:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGranteeProjectLatestRenewalApp]
(
	@GranteeProjectID INT
)
RETURNS INT
AS
BEGIN

	DECLARE @wfta_id INT

	SELECT TOP 1 @wfta_id = wf_task_assignment_id
		FROM WF_TASK_ASSIGNMENT
		WHERE grantee_project_id = @GranteeProjectID
			AND wf_task_id = 4
		ORDER BY award_term_id DESC

	RETURN @wfta_id

END
