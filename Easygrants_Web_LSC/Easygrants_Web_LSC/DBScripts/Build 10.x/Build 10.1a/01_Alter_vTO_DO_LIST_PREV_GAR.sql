
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vTO_DO_LIST_PREV_GAR]

AS
select 
wfta.wf_task_assignment_id,
p.person_id,
gp.primary_organization_id,
awft.description,
c.abbr service_area,
wcy.wfta_year,
wcy.report_cycle_year,
wcy.lsc_gar_cycle_id,
lgc.description lsc_gar_cycle,
wftm.module_name,
wftm.module_config_filename,
lawft.PrintableView_PageKey
from wf_task_assignment wfta
      join a_wf_task awft on wfta.wf_task_id = awft.id
      join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
      join lsc_c_gar_cycle lgc on wcy.lsc_gar_cycle_id = lgc.id
      join person p on wfta.person_id = p.person_id 
      join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id  
      join a_wf_project wfp on gp.wf_project_id  = wfp.id
      join a_competition c on wfp.competition_id = c.id
      join organization o on gp.primary_organization_id = o.organization_id 
      join a_WF_TASK_MODULE wftm ON wfta.wf_task_id = wftm.wf_task_id
			AND wfta.wf_task_role_id = wftm.wf_task_role_id
      join lsc_a_wf_task lawft on wfta.wf_task_id = lawft.id
Where awft.wf_task_type_id = 3
           and wfta.wf_task_status_id = 2
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

