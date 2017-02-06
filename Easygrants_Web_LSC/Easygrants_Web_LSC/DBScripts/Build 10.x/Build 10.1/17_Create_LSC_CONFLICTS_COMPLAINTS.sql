CREATE TABLE LSC_CONFLICTS_COMPLAINTS
   (
     lsc_conflicts_complaints_id int,
     org_id int,
     time_period_id int,
     conflicts varchar(max),
     no_conflicts bit,
     capacity_to_fight varchar(max),
     complaints varchar(max),
     no_complaints bit,
     primary key (lsc_conflicts_complaints)
   )

Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_CONFLICTS_COMPLAINTS',
		1,
		0,
		1)
     

