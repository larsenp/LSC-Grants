CREATE TABLE LSC_ASSESSMENT_DATA_COLLECTION_METHODS
(
  lsc_assessment_data_collection_method_id int not null,
  org_id int,
  time_period_id int,
  grantee_project_id int,
  low_income_persons_interviews int, 
  low_income_persons_surveys int, 
  low_income_persons_focus int, 
  low_income_persons_meetings int, 
  low_income_persons_other int, 
  community_org_interviews int, 
  community_org_surveys int, 
  community_org_focus int, 
  community_org_meetings int, 
  community_org_other int, 
  social_service_org_interviews int, 
  social_service_org_surveys int, 
  social_service_org_focus int, 
  social_service_org_meetings int, 
  social_service_org_other int, 
  courts_interviews int, 
  courts_surveys int, 
  courts_focus int, 
  courts_meetings int, 
  courts_other int, 
  other_providers_interviews int, 
  other_providers_surveys int, 
  other_providers_focus int, 
  other_providers_meetings int, 
  other_providers_other int, 
  private_bar_interviews int, 
  private_bar_surveys int, 
  private_bar_focus int, 
  private_bar_meetings int, 
  private_bar_other int, 
  program_staff_interviews int, 
  program_staff_surveys int, 
  program_staff_focus int, 
  program_staff_meetings int, 
  program_staff_other int, 
  program_board_interviews int, 
  program_board_surveys int, 
  program_board_focus int, 
  program_board_meetings int, 
  program_board_other int, 
  other_assessment_interview int, 
  other_assessment_surveys int, 
  other_assessment_focus int, 
  other_assessment_meetings int, 
  other_assessment_other_methods int,
  other_assessment_description varchar(50), 
  other_data_collection_methods varchar(50), 
   primary key (lsc_assessment_data_collection_method_id)
)
  
Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_ASSESSMENT_DATA_COLLECTION_METHODS',
		1,
		0,
		1)   