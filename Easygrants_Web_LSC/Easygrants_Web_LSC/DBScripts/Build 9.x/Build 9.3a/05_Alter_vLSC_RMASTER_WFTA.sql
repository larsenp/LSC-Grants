ALTER VIEW [dbo].[vLSC_RMASTER_WFTA] 

AS

SELECT 
  
  wfta.wf_task_assignment_id,
  wfta.grantee_project_id,
  rm.Org_ID,
  rm.Addr1_Off,
  rm.Addr2_Off,
  rm.City_Off,
  rm.State_Off,
  rm.Zip_Off,
  rm.State_Name,
  rm.Exec_Dir,
  rm.Chair,
  rm.S_Chair_Title
 FROM [lsc-sql].rindb.dbo.rmaster rm
                JOIN organization o ON rm.org_id = o.legacy_organization_id
                JOIN Grantee_project gp ON gp. primary_organization_id = o.organization_id
                JOIN wf_task_assignment wfta ON gp.grantee_project_id = wfta.grantee_project_id
