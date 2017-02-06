--Stop bringing forward vacancy information (Mantis 2789)
--Bring forward newly added board chair identifier (Mantis 2787)

/****** Object:  StoredProcedure [dbo].[spLSC_COPY_BOARD_STRUCTURE_INFO]    Script Date: 03/24/2011 15:44:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spLSC_COPY_BOARD_STRUCTURE_INFO]
	(@wf_task_assignment_id INT)

AS

DECLARE @prev_wfta_id INT,
	@organization_id INT,
	@time_period_id INT

SET @prev_wfta_id = [dbo].[fnLSCPrevYearAppWfTAID] (@wf_task_assignment_id)

IF @prev_wfta_id IS NULL
	RETURN

SELECT @organization_id = organization_id,
	@time_period_id = time_period_id
	FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR
	WHERE wf_task_assignment_id = @wf_task_assignment_id

CREATE TABLE #board
	(ident int identity(0,1),
	lsc_board_structure_id int NULL,
	mccollum_atty_bylaw int NULL,
	other_atty_bylaw int NULL,
	client_member_bylaw int NULL,
	other_member_bylaw int NULL,
	organization_id INT NULL,
	time_period_id INT NULL)

INSERT #board
	(mccollum_atty_bylaw ,
	other_atty_bylaw ,
	client_member_bylaw ,
	other_member_bylaw ,
	organization_id ,
	time_period_id)
	SELECT mccollum_atty_bylaw ,
		other_atty_bylaw ,
		client_member_bylaw ,
		other_member_bylaw ,
		@organization_id ,
		@time_period_id
		FROM LSC_BOARD_STRUCTURE
		WHERE wf_task_assignment_id = @prev_wfta_id

--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			
DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #board

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_BOARD_STRUCTURE', @count = @rowcount, @mode = 2

UPDATE #board
	SET lsc_board_structure_id = ident + @first_new_id

INSERT LSC_BOARD_STRUCTURE
	(lsc_board_structure_id,
	mccollum_atty_bylaw,
	other_atty_bylaw,
	client_member_bylaw,
	other_member_bylaw,
	organization_id ,
	time_period_id)
	SELECT lsc_board_structure_id,
		mccollum_atty_bylaw,
		other_atty_bylaw,
		client_member_bylaw,
		other_member_bylaw,
		organization_id ,
		time_period_id
		FROM #board
		
EXEC spLSC_COPY_BOARD_CHAIR_INFO
	@organization_id = @organization_id,
	@time_period_id =  @time_period_id,
	@prev_wfta_id = @prev_wfta_id
