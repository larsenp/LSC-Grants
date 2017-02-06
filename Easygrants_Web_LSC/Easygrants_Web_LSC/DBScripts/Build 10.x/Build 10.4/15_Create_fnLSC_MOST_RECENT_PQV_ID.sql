/****** Object:  UserDefinedFunction [dbo].[fnLSC_MOST_RECENT_PQV_ID]    Script Date: 05/19/2011 16:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnLSC_MOST_RECENT_PQV_ID]
	(@organization_id int)
	RETURNS int

AS

BEGIN
	DECLARE @recipient_id int,
		@return_id int

	SELECT @recipient_id = legacy_organization_id
		FROM ORGANIZATION
		WHERE organization_id = @organization_id 

	IF @recipient_id IS NULL
		RETURN NULL

	SELECT TOP 1 @return_id = opp_program_visit_id
		FROM [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.OPP_PROGRAM_VISIT 
		WHERE recipient_id = @recipient_id
			AND purpose = 'Program Quality'
		ORDER BY visit_date DESC

	RETURN @return_id
END
