--Create 2013 categories based on 2012 categories
exec spupdate_idgen @select = 0

create table #c
    (ident int identity(0,1),
    id int,
    description varchar(100),
    lsc_review_performance_area_id int,
    sort_order int)

insert #c
    (description ,
    lsc_review_performance_area_id ,
    sort_order)
    select c.description,
        pa13.id lsc_review_performance_area_id,
        c.sort_order
        from lsc_a_review_category c
            join lsc_a_review_performance_area pa12 on c.lsc_review_performance_area_id = pa12.id
            join lsc_a_review_performance_area pa13 on pa12.sort_order = pa13.sort_order
                and pa13.time_period_id = 18
        where pa12.time_period_id = 17

declare @first_id int, @count int

select @count = count(*) from #c

exec @first_id = spgetid_range_sel 
    @table = 'LSC_a_REVIEW_CATEGORY'
    ,@count = @count

update #c
    set id = ident + @first_id

insert LSC_a_REVIEW_CATEGORY
    (id,
    description ,
    lsc_review_performance_area_id ,
    sort_order)
    select id,
        description ,
        lsc_review_performance_area_id ,
        sort_order
        from #c 

select * from #c
drop table #c 

--Link 2013 criteria to 2013 categories
update cr18
    set lsc_review_category_id = ca18.id
    from lsc_a_review_criterion cr17
        join lsc_a_review_category ca17 on cr17.lsc_review_category_id = ca17.id
        join lsc_a_review_performance_area pa17 on cr17.lsc_review_performance_area_id = pa17.id
        join lsc_a_review_performance_area pa18 on pa17.sort_order = pa18.sort_order
            and pa18.time_period_id = 18
        join lsc_a_review_category ca18 on pa18.id = ca18.lsc_review_performance_area_id
            and ca17.sort_order = ca18.sort_order
        join lsc_a_review_criterion cr18 on pa18.id = cr18.lsc_review_performance_area_id
            and cr17.abbr = cr18.abbr
    where pa17.time_period_id = 17

