/****** Object:  StoredProcedure [dbo].[spLSC_COPY_BOARD_CHAIR_INFO]    Script Date: 03/20/2012 10:45:07 ******/
/*
Copies existing board chair data into a new application.

Not used to copy into NICs because NICs don't designate board chairs.

Copies preferentially from Program Directory information based on a first name - last name match.

If a match can't be found from the Program Directory, the procedure copies from the previous year's application.
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spLSC_COPY_BOARD_CHAIR_INFO]
	(@organization_id INT, 
	@time_period_id INT)

AS

DECLARE @prev_time_period_id INT,
	@prev_chair_id INT,
	@structure_id INT,
	@chair VARCHAR(200),
	@chair_first VARCHAR(100),
	@chair_last VARCHAR(100),
	@curr_chair_id INT

--Determine time period ID for previous year
SELECT @prev_time_period_id = tp_prev.id
	FROM c_TIME_PERIOD tp_curr
		JOIN c_TIME_PERIOD tp_prev ON tp_curr.sort_order - 1 = tp_prev.sort_order
	WHERE tp_curr.id = @time_period_id

--Get LSC_BOARD_STRUCTURE id for this organization and year. If not found, quit (info hasn't been copied forward yet).
SELECT @structure_id = lsc_board_structure_id
	FROM LSC_BOARD_STRUCTURE
	WHERE organization_id = @organization_id
		AND time_period_id = @time_period_id
		AND is_nic_data = 0

IF @structure_id IS NULL
	RETURN

--Check if board chair has already been set for this year. If so, quit.
SELECT @curr_chair_id = board_chair_contact_id
	FROM LSC_BOARD_STRUCTURE
	WHERE lsc_board_structure_id = @structure_id

IF @curr_chair_id IS NOT NULL
	RETURN

--Get board chair name from Program Directory
SELECT @chair = Chair
	FROM ORGANIZATION o
		JOIN [LSC-SQL].RINDB.dbo.RMaster r ON o.legacy_organization_id = r.Org_ID
		WHERE o.organization_id = @organization_id

--Call fnLSCParseFullName to parse the name.
SELECT @chair_first = name_first,
	@chair_last = name_last
	FROM dbo.fnLSCParseFullName(@chair)

--Match chair name from Program Directory with this year's board member info
SELECT @curr_chair_id = id
	FROM LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
	WHERE organization_id = @organization_id
		AND time_period_id = @time_period_id
		AND affiliation_type_id = 3
		AND is_nic_data = 0
		AND name_first = @chair_first
		AND name_last= @chair_last

IF @curr_chair_id IS NULL
BEGIN

	--If no match, try matching with last year's board member info
	SELECT @prev_chair_id = board_chair_contact_id
		FROM LSC_BOARD_STRUCTURE
		WHERE organization_id = @organization_id
			AND time_period_id = @prev_time_period_id
			AND is_nic_data = 0

	SELECT @chair_first = name_first,
		@chair_last = name_last
		FROM LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
		WHERE id = @prev_chair_id

	SELECT @curr_chair_id = id
		FROM LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
		WHERE organization_id = @organization_id
			AND time_period_id = @time_period_id
			AND affiliation_type_id = 3
			AND is_nic_data = 0
			AND name_first = @chair_first
			AND name_last= @chair_last
END

--Set board chair ID for this year to the selected contact ID.
UPDATE LSC_BOARD_STRUCTURE
	SET board_chair_contact_id = @curr_chair_id
	WHERE lsc_board_structure_id = @structure_id