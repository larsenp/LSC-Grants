

CREATE VIEW [dbo].[vLSC_WFTA_a_FUND]

AS
SELECT wfta.wf_task_assignment_id, 
		f.fund_name, 
		f.fund_id, 
		f.fund_amount
FROM wf_task_assignment wfta 
         join vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy on wfta.wf_task_assignment_id = cwosy.wf_task_assignment_id
         join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
         join a_wf_project wfp on gp.wf_project_id = wfp.id
            join a_competition c on wfp.competition_id = c.id
            join a_fund f on c.abbr + ' ' + CAST(cwosy.wfta_year as varchar(4)) = f.fund_name
