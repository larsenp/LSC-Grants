/****** Object:  UserDefinedFunction [dbo].[fnLSC_HAS_RECENT_PQV]    Script Date: 04/22/2014 16:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[fnLSC_HAS_RECENT_PQV]
	(@organization_id int)
	RETURNS bit

AS

BEGIN
	DECLARE @recipient_id int,
		@count int,
		@curr_year int,
		@early bit

	SET @curr_year = YEAR(GETDATE())

	SELECT @recipient_id = legacy_organization_id
		FROM ORGANIZATION
		WHERE organization_id = @organization_id 

	IF @recipient_id IS NULL
		RETURN NULL

	--Visit completed this year with report due to be submitted in time for competition - post-PQV
	SELECT @count = COUNT(*)
		FROM [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.OPP_PROGRAM_VISIT 
		WHERE recipient_id = @recipient_id
			AND purpose = 'Program Quality'
			AND YEAR(end_date) = @curr_year
			AND is_early_year_visit = 1

	IF @count > 0
		RETURN 1

	--Visit completed in the last calendar year - post-PQV
	SELECT @count = COUNT(*)
		FROM [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.OPP_PROGRAM_VISIT 
		WHERE recipient_id = @recipient_id
			AND purpose = 'Program Quality'
			AND YEAR(end_date) < @curr_year
			AND @curr_year - YEAR(end_date) = 1

	IF @count > 0
		RETURN 1

	--Visit completed two calendar years ago
	SELECT @count = COUNT(*)
		FROM [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.OPP_PROGRAM_VISIT 
		WHERE recipient_id = @recipient_id
			AND purpose = 'Program Quality'
			AND YEAR(end_date) < @curr_year
			AND @curr_year - YEAR(end_date) = 2

	--No visit in last two calendar years OR visit this year not marked as early - standard
	IF @count = 0
		RETURN 0

	--Check for two consecutive years of post-PQV applications
	SELECT @count = COUNT(DISTINCT wfta_year)
		FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR
		WHERE recipient_id = @recipient_id
			AND wfta_year in (@curr_year, @curr_year - 1)
			AND wf_task_id IN (66,67)

	--Visit completed two calendar years ago and two years of post-PQV apps - standard
	IF @count = 2
		RETURN 0
	--Visit completed two calendar years ago and less than two years of post-PQV apps - post-PQV
	ELSE
		RETURN 1

	RETURN 0

END
