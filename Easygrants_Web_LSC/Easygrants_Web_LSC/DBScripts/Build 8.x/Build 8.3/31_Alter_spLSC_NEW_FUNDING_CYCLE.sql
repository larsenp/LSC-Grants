SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spLSC_NEW_FUNDING_CYCLE]
	(@serv_area varchar(10),
	@new_time_period_id int)

AS

SET NOCOUNT ON

declare @competition_id int,
	@new_year int,
	@new_year_str varchar(4),
	@cycle_end_year_str varchar(4),
	@new_cycle_abbr varchar(10),
	@prev_proj_id int,
	@new_proj_id int,
	@fund_id int

select @competition_id = id 
	from a_competition
		where abbr = @serv_area

select @new_year = sort_order
	from c_time_period
	where id = @new_time_period_id

set @new_year_str = cast(@new_year as varchar(4))

set @cycle_end_year_str = cast(@new_year + 2 as varchar(4))

--Get ID of most recent funding cycle for this service area
SELECT TOP 1 @prev_proj_id = wfp.id
	from a_wf_project wfp
		join c_time_period tp on wfp.time_period_id = tp.id
	where competition_id = @competition_id
	order by tp.sort_order desc

--Build abbreviation for new funding cycle
select @new_cycle_abbr = replace(description, substring(description, datalength(description) - 3, 4), @new_year_str)
	from a_wf_project
	where id = @prev_proj_id

PRINT '@new_cycle_abbr = ' + @new_cycle_abbr

select @fund_id = fund_id
	from a_fund
	where fund_name = @new_cycle_abbr

if @fund_id is null
begin
	print 'no fund.'
	return
end

BEGIN TRAN

	EXEC spUPDATE_IDGEN @select = 0

	exec @new_proj_id = getid_sel @table = 'a_WF_PROJECT', @mode = 2

	INSERT a_WF_PROJECT
		(id,
		description,
		competition_id,
		support_email_address,
		content_email_address,
		start_date,
		end_date,
		time_period_id,
		auto_generate_payment,
		default_payment_setup,
		auto_generate_report,
		default_report_setup,
		award_term,
		fund_id)
		SELECT @new_proj_id ,
			@new_cycle_abbr ,
			competition_id,
			'techsupport@lsc.gov' ,
			'competition@lsc.gov' ,
			cast(@new_year_str + '-01-01' AS DATETIME) ,
			cast(@cycle_end_year_str + '-12-31' AS DATETIME) ,
			@new_time_period_id ,
			0 ,
			0 ,
			0 ,
			0 ,
			3 ,
			@fund_id 
			FROM a_wf_project
			WHERE id = @prev_proj_id

	EXEC spCOPY_BUDGET_CATEGORIES_TO_PROJECT
		@source_project_id = 1,
		@target_project_id = @new_proj_id

COMMIT TRAN

