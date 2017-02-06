CREATE VIEW [dbo].[vLSC_BOARD]
 
AS
 
SELECT o.legacy_organization_id Org_ID, 
 wcy.wfta_year [Year],
 c.abbr Serv_Area,
 wftaa.name_first + ' ' + wftaa.name_last Full_Name,
 substring(bms.abbr, 1, 1) [Status],
 wftaa.appointing_organization Appointing_Org,
 e.sort_order Ethnicity,
 substring(g.abbr, 1, 1) Gender,
 wftaa.address Address,
 wftaa.city City,
 sp.abbr State,
 wftaa.zip_postal_code Zip,
 wftaa.phone Phone,
 substring(bmat.abbr, 1, 1) phone_type,
 CASE WHEN board_member_type_id = 1 THEN 'M'
  WHEN board_member_type_id = 2 THEN 'A'
  WHEN board_member_type_id = 3 THEN 'C'
  WHEN board_member_type_id = 4 THEN 'O' END member_type,
 wftaa.relevant_experience Experience,
 wftaa.modify_date Updated,
 wftaa.name_first + ISNULL(' ' + wftaa.name_middle, '') First_Mid,
 wftaa.name_last Last_Name,
 e.description Ethnicity_Description
 FROM lsc_wf_task_assignment_affiliations wftaa
  JOIN wf_task_assignment wfta on wftaa.wf_task_assignment_id = wfta.wf_task_assignment_id
  JOIN vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
  JOIN grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
  JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
  JOIN a_COMPETITION c ON wfp.competition_id = c.id
  JOIN organization o on gp.primary_organization_id = o.organization_id
  LEFT JOIN c_ethnicity e on wftaa.ethnicity_id = e.id
  LEFT JOIN c_gender g on wftaa.gender_id = g.id
  LEFT JOIN c_state_prov sp on wftaa.state_province_id = sp.id
  LEFT JOIN LSC_c_BOARD_MEMBER_ADDRESS_TYPE bmat on wftaa.address_phone_type_id = bmat.id
  LEFT JOIN LSC_c_BOARD_MEMBER_STATUS bms ON wftaa.status_id = bms.id
 WHERE wftaa.affiliation_type_id = 3
  AND wfta.wf_task_id in (2,4)
  AND wfta.wf_task_status_id = 2
