/****** Object:  UserDefinedFunction [dbo].[fnLSC_HAS_RECENT_PQV]    Script Date: 03/07/2012 15:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnLSC_HAS_RECENT_PQV]
	(@organization_id int)
	RETURNS bit

AS

BEGIN
	DECLARE @recipient_id int,
		@count int

	SELECT @recipient_id = legacy_organization_id
		FROM ORGANIZATION
		WHERE organization_id = @organization_id 

	IF @recipient_id IS NULL
		RETURN NULL

	SELECT @count = COUNT(*)
		FROM [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.OPP_PROGRAM_VISIT 
		WHERE recipient_id = @recipient_id
			AND purpose = 'Program Quality'
			AND YEAR(end_date) = YEAR(GETDATE())
			AND is_early_year_visit = 1

	IF @count > 0
		RETURN 1

	SELECT @count = COUNT(*)
		FROM [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.OPP_PROGRAM_VISIT 
		WHERE recipient_id = @recipient_id
			AND purpose = 'Program Quality'
			AND YEAR(end_date) < YEAR(GETDATE())
			AND YEAR(GETDATE()) - YEAR(end_date) < 3

	IF @count > 0
		RETURN 1
	
	RETURN 0
END
