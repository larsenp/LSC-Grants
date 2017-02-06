CREATE PROCEDURE spLSC_ASSIGN_TIG_NUMBER
	(@grantee_project_id int)

AS

BEGIN TRAN

	--Get two-digit year
	declare @year varchar(2)

	SELECT @year = SUBSTRING(CAST(tp.sort_order AS varchar(4)), 3, 2)
		FROM GRANTEE_PROJECT gp
			JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
			JOIN c_TIME_PERIOD tp ON wfp.time_period_id = tp.id
		WHERE gp.grantee_project_id = @grantee_project_id

	--Get new TIG number
	DECLARE @tig varchar(5)

	SELECT @tig = MAX(legacy_grant_id)
		FROM GRANTEE_PROJECT gp
			JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		WHERE wfp.competition_id = 456
			AND gp.legacy_grant_id like @year + '%'

	IF @tig IS NULL
		SET @tig = @year + '001'
	ELSE
	BEGIN
		SET @tig = CAST(CAST(@tig AS int) + 1 AS varchar(5))
	END

	UPDATE GRANTEE_PROJECT
		SET legacy_grant_id = @tig
		WHERE grantee_project_id = @grantee_project_id

COMMIT TRAN