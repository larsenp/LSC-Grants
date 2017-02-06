CREATE PROCEDURE spLSC_COPY_BOARD_CHAIR_INFO
	(@organization_id INT, 
	@time_period_id INT, 
	@prev_wfta_id INT)

AS

DECLARE @prev_chair_id INT,
	@structure_id INT,
	@chair_first VARCHAR(100),
	@chair_last VARCHAR(100),
	@curr_chair_id INT

--Get board chair ID from previous year. If not found, quit.
SELECT @prev_chair_id = board_chair_contact_id
	FROM LSC_WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @prev_wfta_id

IF @prev_chair_id IS NULL
	RETURN

--Get LSC_BOARD_STRUCTURE id for this organization and year. If not found, quit (info hasn't been copied forward yet).
SELECT @structure_id = lsc_board_structure_id
	FROM LSC_BOARD_STRUCTURE
	WHERE organization_id = @organization_id
		AND time_period_id = @time_period_id

IF @structure_id IS NULL
	RETURN

--Check if board chair has already been set for this year. If so, quit.
SELECT @curr_chair_id = board_chair_contact_id
	FROM LSC_BOARD_STRUCTURE
	WHERE lsc_board_structure_id = @structure_id

IF @curr_chair_id IS NOT NULL
	RETURN

--Get first and last name of last year's board chair. Search this year's board member info for matching name and get ID of that contact.
SELECT @chair_first = name_first,
	@chair_last = name_last
	FROM LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
	WHERE id = @prev_chair_id

SELECT @curr_chair_id = id
	FROM LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
	WHERE organization_id = @organization_id
		AND time_period_id = @time_period_id
		AND affiliation_type_id = 3
		AND name_first = @chair_first
		AND name_last= @chair_last

--Set board chair ID for this year to the selected contact ID.
UPDATE LSC_BOARD_STRUCTURE
	SET board_chair_contact_id = @curr_chair_id
	WHERE lsc_board_structure_id = @structure_id