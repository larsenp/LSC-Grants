ALTER PROCEDURE [dbo].[spLSC_ASSIGN_SUBRECIPIENT_ID]
	(@organization_id int)

AS

DECLARE @lsc_organization_id INT,
	@recipient_id INT,
	@state_code VARCHAR(3),
	@srid VARCHAR(6),
	@max_srid VARCHAR(6),
	@srnum INT,
	@count INT

BEGIN TRAN
	SET @srid = 'X'

	--If a subrecipient ID has already been assigned, return it.
	SELECT @srid = subrecipient_id
		FROM LSC_ORGANIZATION
		WHERE organization_id = @organization_id

	IF @srid <> 'X'
	BEGIN
		COMMIT TRAN
		RETURN @srid
	END

	--Create LSC_ORGANIZATION row if it doesn't already exist.
	SELECT @count = COUNT(*)
		FROM LSC_ORGANIZATION
		WHERE organization_id = @organization_id

	IF @count = 0
	BEGIN

		DECLARE @new_id INT

		EXEC @new_id = getid_sel
			@table = 'LSC_ORGANIZATION',
			@mode = 2

		INSERT LSC_ORGANIZATION
			(lsc_organization_id,
			organization_id)
			VALUES(@new_id,
				@organization_id)
	END

	--If a recipient ID has been assigned, use it for the subrecipient ID as well, 
	--verifying that it doesn't duplicate an existing subrecipient ID.
	SELECT @recipient_id = legacy_organization_id
		FROM ORGANIZATION
		WHERE organization_id = @organization_id

	IF @recipient_id IS NOT NULL
	BEGIN
		SELECT @count = COUNT(*)
			FROM LSC_ORGANIZATION
			WHERE subrecipient_id = CAST(@recipient_id AS VARCHAR(6))

		IF @count = 0
		BEGIN
			UPDATE LSC_ORGANIZATION
				SET subrecipient_id = CAST(@recipient_id AS VARCHAR(6))
				WHERE organization_id = @organization_id

			COMMIT TRAN
			RETURN
		END
	END

	--If a recipient ID has not been assigned, or if the recipient ID is already in use as
	--a subrecipient ID for a different organization, create and assign a new subrecipient ID.

	SELECT @state_code = '0' + lsp.state_code
		FROM ORGANIZATION o
			JOIN ADDRESS a ON o.organization_id = a.entity_id
				AND a.entity_type_id = 2
				AND a.is_primary = 1
			JOIN LSC_c_STATE_PROV lsp ON a.state_province_id = lsp.state_province_id
		WHERE o.organization_id = @organization_id

	SELECT @max_srid = max(subrecipient_id)
		FROM LSC_ORGANIZATION
		WHERE subrecipient_id like @state_code + '[0-9][0-9][0-9]'

	IF @max_srid IS NULL
		SET @srnum = 1
	ELSE
	BEGIN
		SET @srnum = CAST(RIGHT(@max_srid, 3) AS INT)

		SET @srnum = @srnum + 1
	END

	IF @srnum > 999
		RETURN 'X'

	SET @srid = CAST(@srnum AS VARCHAR(6))

	WHILE DATALENGTH(@srid) < 3
		SET @srid = '0' + @srid

	SET @srid = @state_code + @srid

	UPDATE LSC_ORGANIZATION
		SET subrecipient_id = @srid
		WHERE organization_id = @organization_id

COMMIT TRAN

RETURN @srid
