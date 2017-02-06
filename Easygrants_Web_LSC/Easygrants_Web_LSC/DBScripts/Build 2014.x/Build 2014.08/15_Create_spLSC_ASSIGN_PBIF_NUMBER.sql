CREATE PROCEDURE [dbo].[spLSC_ASSIGN_PBIF_NUMBER]
	(@grantee_project_id int)

AS

BEGIN TRAN

	--Check for existing number
	DECLARE @pbif varchar(10)
	SELECT @pbif = legacy_grant_id
		FROM GRANTEE_PROJECT
		WHERE grantee_project_id = @grantee_project_id

	IF @pbif IS NOT NULL 
	BEGIN
		COMMIT TRAN
		RETURN
	END

	--Get two-digit year
	declare @year varchar(2)

	SELECT @year = SUBSTRING(CAST(tp.sort_order AS varchar(4)), 3, 2)
		FROM GRANTEE_PROJECT gp
			JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
			JOIN c_TIME_PERIOD tp ON wfp.time_period_id = tp.id
		WHERE gp.grantee_project_id = @grantee_project_id

	--Get new PBIF number
	SELECT @pbif = MAX(legacy_grant_id)
		FROM GRANTEE_PROJECT gp
			JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		WHERE wfp.competition_id = 460
			AND gp.legacy_grant_id like 'PB' + @year + '%'

	IF @pbif IS NULL
		SET @pbif = 'PB' + @year + '001'
	ELSE
	BEGIN
		SET @pbif = 'PB' + CAST(CAST(SUBSTRING(@pbif, 3, LEN(@pbif) - 2) AS int) + 1 AS varchar(5))
	END

	UPDATE GRANTEE_PROJECT
		SET legacy_grant_id = @pbif
		WHERE grantee_project_id = @grantee_project_id

COMMIT TRAN

