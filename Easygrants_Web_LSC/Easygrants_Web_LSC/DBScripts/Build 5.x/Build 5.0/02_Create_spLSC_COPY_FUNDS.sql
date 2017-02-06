/****** Object:  StoredProcedure [dbo].[spLSC_COPY_FUNDS]    Script Date: 03/10/2009 12:01:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spLSC_COPY_FUNDS]
	(@prev_year varchar(4), 
	@new_year varchar(4))

as

create table #newfund
	(ident int identity(0,1),
	fund_id int,
	fund_name varchar(50),
	fund_amount money)

--Copy previous year fund info into new rows in temp table
insert #newfund
	(fund_name,
	fund_amount)
select replace(fund_name, @prev_year, @new_year),
	fund_amount
	from a_fund
	where fund_name like '%' + @prev_year

--If fund has already been created for the new year, delete that service area from the temp table
delete #newfund
	from #newfund nf
		join a_fund f on nf.fund_name = f.fund_name

--Assign fund IDs to new funds
EXEC spUPDATE_IDGEN @select = 0

DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #newfund

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'a_FUND', @count = @rowcount, @mode = 2

UPDATE #newfund
	SET fund_id = ident + @first_new_id

--Write new fund rows to database
INSERT a_FUND
	(fund_id ,
	fund_name,
	fund_account_number ,
	fund_amount,
	fund_start_date,
	fund_end_date,
	create_date,
	modify_date )
	SELECT fund_id,
		fund_name,
		1,
		fund_amount,
		cast(@new_year + '-01-01' as datetime),
		cast(@new_year + '-12-31' as datetime),
		getdate(),
		getdate()
		FROM #newfund