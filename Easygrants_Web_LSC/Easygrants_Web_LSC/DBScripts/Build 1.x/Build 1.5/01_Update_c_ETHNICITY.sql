update c_ethnicity
	set end_date = '5/11/2008'
	where id in (2,3)

update c_ethnicity
	set sort_order = 30,
		abbr = 'Hispanic'
	where id = 1

insert c_ethnicity
	(id, abbr, description, sort_order)
	values
		(4, 'Caucasian', 'Caucasian', 10)

insert c_ethnicity
	(id, abbr, description, sort_order)
	values
		(5, 'African American', 'African American', 20)

insert c_ethnicity
	(id, abbr, description, sort_order)
	values
		(6, 'Native American', 'Native American', 40)

insert c_ethnicity
	(id, abbr, description, sort_order)
	values
		(7, 'Asian or Pacific Islander', 'Asian or Pacific Islander', 50)

insert c_ethnicity
	(id, abbr, description, sort_order)
	values
		(8, 'Other', 'Other', 99)

update s_id_gen
	set next_id = 9
	where table_name = 'c_ethnicity'

update c_ethnicity
	set description = cast(sort_order as varchar(2)) + '-' + abbr
	where end_date is null