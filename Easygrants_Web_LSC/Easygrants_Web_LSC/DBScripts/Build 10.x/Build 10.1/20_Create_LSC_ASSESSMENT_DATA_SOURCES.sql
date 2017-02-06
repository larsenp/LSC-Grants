CREATE TABLE LSC_ASSESSMENT_DATA_SOURCES
(
  lsc_assessment_data_sources_id int,
  org_id int,
  time_period_id int,
  census_data bit,
  other_legal_needs_studies bit,
  GIS_mapping bit,
  other_information bit,
  intake_data_not_accepted bit,
  cms_data_closed bit,
  cms_data_showing bit,
  other_text varchar(max),
  other_selection bit,
  primary key(lsc_assessment_data_sources_id)
)

Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_ASSESSMENT_DATA_SOURCES',
		1,
		0,
		1)   