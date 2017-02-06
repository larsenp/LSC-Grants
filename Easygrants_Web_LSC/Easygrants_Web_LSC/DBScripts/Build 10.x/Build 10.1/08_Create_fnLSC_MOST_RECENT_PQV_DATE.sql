CREATE FUNCTION dbo.fnLSC_MOST_RECENT_PQV_DATE
	(@organization_id int)
	RETURNS datetime

AS

BEGIN
	DECLARE @recipient_id int,
		@return_date datetime

	SELECT @recipient_id = legacy_organization_id
		FROM ORGANIZATION
		WHERE organization_id = @organization_id 

	IF @recipient_id IS NULL
		RETURN NULL

	SELECT TOP 1 @return_date = visit_date
		FROM [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.OPP_PROGRAM_VISIT 
		WHERE recipient_id = @recipient_id
			AND purpose = 'Program Quality'
		ORDER BY visit_date DESC

	RETURN @return_date 
END
