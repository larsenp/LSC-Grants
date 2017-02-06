CREATE TABLE LSC_ORG_OVERVIEW
( 
     lsc_org_overview_id int,
	 org_id int,
     time_period_id int,
     grantee_project_id int,
     rural_urban_mixed varchar(max),
     affect_on_clients varchar(max),
     distinct_features_sa varchar(max),
     full_service_by_applicant varchar(max),
     limited_service_by_applicant varchar(max),
     other_providers varchar(max),
     delivery_methods_org varchar(max),
     distinct_features_org varchar(max),
     primary key (lsc_org_overview_id)
)
  

Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_ORG_OVERVIEW',
		1,
		0,
		1)   

