CREATE TABLE LSC_CONTINUITY_OPERATIONS_PLANNING
(
  lsc_continuity_operations_planning_id int,
  org_id int,
  time_period_id int,
  has_written_plan bit,
  is_plan_ensure_safety bit,
  is_plan_continuing_service bit,
  is_plan_preserving_data bit,
  is_plan_continuing_communication bit,
  is_plan_relocation_worksite bit,
  is_plan_coordinating bit,
  primary key (lsc_continuity_operations_planning_id)
)
  

Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_CONTINUITY_OPERATIONS_PLANNING',
		1,
		0,
		1)   

select * from s_id_gen