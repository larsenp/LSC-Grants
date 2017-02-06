/****** Object:  View [dbo].[vTO_DO_LIST_PREV_GAR]    Script Date: 09/22/2009 15:08:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vTO_DO_LIST_PREV_GAR]

AS

select 
wfta.wf_task_assignment_id,
p.person_id,
--awft.id,
awft.description,
--wfta.person_id, 
--o.organization_name,
c.abbr service_area,
wcy.wfta_year,
wcy.report_cycle_year,
wftm.module_name,
wftm.module_config_filename,
lawft.PrintableView_PageKey
from wf_task_assignment wfta
      join a_wf_task awft on wfta.wf_task_id = awft.id
      join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
      join person p on wfta.person_id = p.person_id 
      join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id  
      join a_wf_project wfp on gp.wf_project_id  = wfp.id
      join a_competition c on wfp.competition_id = c.id
      join organization o on gp.primary_organization_id = o.organization_id 
      join a_WF_TASK_MODULE wftm ON wfta.wf_task_id = wftm.wf_task_id
			AND wfta.wf_task_role_id = wftm.wf_task_role_id
      join lsc_a_wf_task lawft on wfta.wf_task_id = lawft.id
Where awft.wf_task_type_id = 3
         and wcy.wfta_year in (2008,2009)
--          and legacy_organization_id = 902000
           and wfta.wf_task_status_id = 2
