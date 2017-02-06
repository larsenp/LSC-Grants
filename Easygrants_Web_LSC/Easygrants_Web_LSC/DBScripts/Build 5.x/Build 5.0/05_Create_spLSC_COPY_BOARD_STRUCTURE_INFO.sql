/****** Object:  StoredProcedure [dbo].[spLSC_COPY_BOARD_STRUCTURE_INFO]    Script Date: 03/14/2009 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLSC_COPY_BOARD_STRUCTURE_INFO]
	(@wf_task_assignment_id INT)

AS

DECLARE @prev_wfta_id INT

SET @prev_wfta_id = [dbo].[fnLSCPrevYearAppWfTAID] (@wf_task_assignment_id)

IF @prev_wfta_id IS NULL
	RETURN

CREATE TABLE #board
	(ident int identity(0,1),
	lsc_board_structure_id int NULL,
	wf_task_assignment_id int NULL,
	mccollum_atty_bylaw int NULL,
	other_atty_bylaw int NULL,
	client_member_bylaw int NULL,
	other_member_bylaw int NULL,
	mccollum_atty_less_90 int NULL,
	other_atty_less_90 int NULL,
	client_member_less_90 int NULL,
	other_member_less_90 int NULL,
	mccollum_atty_90_day_1_yr int NULL,
	other_atty_90_day_1_yr int NULL,
	client_member_90_day_1_yr int NULL,
	other_member_90_day_1_yr int NULL,
	mccollum_atty_greater_1_yr int NULL,
	other_atty_greater_1_yr int NULL,
	client_member_greater_1_yr int NULL,
	other_member_greater_1_yr int NULL)

INSERT #board
	(wf_task_assignment_id ,
	mccollum_atty_bylaw ,
	other_atty_bylaw ,
	client_member_bylaw ,
	other_member_bylaw ,
	mccollum_atty_less_90 ,
	other_atty_less_90 ,
	client_member_less_90 ,
	other_member_less_90 ,
	mccollum_atty_90_day_1_yr ,
	other_atty_90_day_1_yr ,
	client_member_90_day_1_yr ,
	other_member_90_day_1_yr ,
	mccollum_atty_greater_1_yr ,
	other_atty_greater_1_yr ,
	client_member_greater_1_yr ,
	other_member_greater_1_yr )
	SELECT @wf_task_assignment_id ,
		mccollum_atty_bylaw ,
		other_atty_bylaw ,
		client_member_bylaw ,
		other_member_bylaw ,
		mccollum_atty_less_90 ,
		other_atty_less_90 ,
		client_member_less_90 ,
		other_member_less_90 ,
		mccollum_atty_90_day_1_yr ,
		other_atty_90_day_1_yr ,
		client_member_90_day_1_yr ,
		other_member_90_day_1_yr ,
		mccollum_atty_greater_1_yr ,
		other_atty_greater_1_yr ,
		client_member_greater_1_yr ,
		other_member_greater_1_yr 
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
	wf_task_assignment_id,
	mccollum_atty_bylaw,
	other_atty_bylaw,
	client_member_bylaw,
	other_member_bylaw,
	mccollum_atty_less_90,
	other_atty_less_90,
	client_member_less_90,
	other_member_less_90,
	mccollum_atty_90_day_1_yr,
	other_atty_90_day_1_yr,
	client_member_90_day_1_yr,
	other_member_90_day_1_yr,
	mccollum_atty_greater_1_yr,
	other_atty_greater_1_yr,
	client_member_greater_1_yr,
	other_member_greater_1_yr)
	SELECT lsc_board_structure_id,
		wf_task_assignment_id,
		mccollum_atty_bylaw,
		other_atty_bylaw,
		client_member_bylaw,
		other_member_bylaw,
		mccollum_atty_less_90,
		other_atty_less_90,
		client_member_less_90,
		other_member_less_90,
		mccollum_atty_90_day_1_yr,
		other_atty_90_day_1_yr,
		client_member_90_day_1_yr,
		other_member_90_day_1_yr,
		mccollum_atty_greater_1_yr,
		other_atty_greater_1_yr,
		client_member_greater_1_yr,
		other_member_greater_1_yr
		FROM #board