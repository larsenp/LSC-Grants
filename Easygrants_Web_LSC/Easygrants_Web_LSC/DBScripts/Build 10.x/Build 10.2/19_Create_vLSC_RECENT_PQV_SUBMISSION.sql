CREATE VIEW [dbo].[vLSC_RECENT_PQV_SUBMISSION]

AS

select 
	v.wf_task_assignment_id, 
    o.organization_id,
	pqv.legacy_organization_id, 
	pqv.organization_name, 
	pqv.most_recent_pqv,
    v.due_date,
    pqv.has_recent_pqv,
	case when getdate() > isnull(v.due_date,0) then 1 else 0 end submission_flag
from vLSC_ORG_RECENT_PQV pqv
              JOIN Organization o ON pqv.legacy_organization_id = o.legacy_organization_id
              JOIN grantee_project gp ON gp.primary_organization_id = o.organization_id
              JOIN wf_task_assignment wfta ON wfta.grantee_project_id = gp.grantee_project_id
              JOIN vWfTaskAssignmentCalculatedDates v ON wfta.wf_task_assignment_id = v.wf_task_assignment_id
              --JOIN vWFTA_COMPETITION_YEAR wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
Where pqv.has_recent_pqv = 1 and wfta.wf_task_id = 3 
--and wcy.wfta_year = 2012