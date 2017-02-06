--check first names
select person_id,
	name_first,
	ascii(substring(name_first, datalength(name_first), 1)),
	substring(name_first, 1, datalength(name_first) - 1)
	from person
	where ascii(substring(name_first, datalength(name_first), 1)) < 65
		or ascii(substring(name_first, datalength(name_first), 1)) > 122

--Run this update once, then rerun select to see if there are any remaining unwanted trailing characters
update person
	set name_first = rtrim(name_first)

--Run this update repeatedly until it updates 0 rows
update person
	set name_first = substring(name_first, 1, datalength(name_first) - 1)
	where ascii(substring(name_first, datalength(name_first), 1)) < 65
		or ascii(substring(name_first, datalength(name_first), 1)) > 122

--check last names
select person_id,
	name_last,
	ascii(substring(name_last, datalength(name_last), 1)),
	substring(name_last, 1, datalength(name_last) - 1)
	from person
	where ascii(substring(name_last, datalength(name_last), 1)) < 65
		or ascii(substring(name_last, datalength(name_last), 1)) > 122

--Run this update once, then rerun select to see if there are any remaining unwanted trailing characters
update person
	set name_last = rtrim(name_last)

--Run this update repeatedly until it updates 0 rows
update person
	set name_last = substring(name_last, 1, datalength(name_last) - 1)
	where ascii(substring(name_last, datalength(name_last), 1)) < 65
		or ascii(substring(name_last, datalength(name_last), 1)) > 122

