CREATE PROCEDURE spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS
	(@recipient_id int,
	@service_area varchar(10))
--@service_area represents the one service area for the designated grantee for which all forms will be assigned.

/*
This stored procedure was developed in order to remove duplicate reporting task assignments from grantees with more
than one service area. The year 2008 is hard-coded into the stored procedure because it is anticipated that the 
procedure will not be needed in future years. The assignment of reporting tasks for 2009 and future cycles should
not include duplicate assignments in the first place.

- Peter Larsen, 1/21/2009
*/

AS

UPDATE WF_TASK_ASSIGNMENT
	SET wf_task_status_id = 3
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
		JOIN lsc_a_wf_task lwft ON wfta.wf_task_id = lwft.wf_task_id
		JOIN vwfta_competition_year wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		JOIN grantee_project gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN organization o ON gp.primary_organization_id = o.organization_id
		JOIN a_wf_project wfp ON gp.wf_project_id = wfp.id
		JOIN a_competition c ON wfp.competition_id = c.id
	WHERE lwft.assign_report_per_service_area = 0
		and wcy.report_cycle_year = 2008
		and o.legacy_organization_id = @recipient_id
		and c.description <> @service_area
		
