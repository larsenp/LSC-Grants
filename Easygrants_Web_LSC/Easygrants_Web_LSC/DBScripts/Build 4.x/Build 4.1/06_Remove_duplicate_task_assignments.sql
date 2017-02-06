/*
Run this query to find multi-service-area grantees (two or more rows in the query result with the same legacy_organization_id value). 
Review the data to determine the "main" service area (in almost all cases, the unique basic field service area; for grantees with more than
one basic field service area, select the first one in alphabetical order). For each multi-service area grantee, execute the stored procedure 
spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS, passing the appropriate values for recipient ID and service area.

select distinct o.legacy_organization_id, 
	c.description service_area,
	sa.service_area_type_id
	from wf_task_assignment wfta
		join a_wf_task wft on wfta.wf_task_id = wft.id
		join lsc_a_wf_task lwft on wft.id = lwft.wf_task_id
		join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join organization o on gp.primary_organization_id = o.organization_id
		join a_wf_project wfp on gp.wf_project_id = wfp.id
		join a_competition c on wfp.competition_id = c.id
		join lsc_a_service_area sa on c.id = sa.competition_id
	where lwft.assign_report_per_service_area = 0
		and wcy.report_cycle_year = 2008
		and o.legacy_organization_id > 948010
	order by o.legacy_organization_id,
		sa.service_area_type_id,
		c.description

Based on the query above, the stored procedure for removing duplicate task assignments was run
once for each multi-service-area grantee, as follows:
*/

EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 120000, @service_area = 'ME-1'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 233150, @service_area = 'NY-22'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 253010, @service_area = 'PR-1'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 321016, @service_area = 'MD-1'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 331020, @service_area = 'NJ-16'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 339000, @service_area = 'PA-1'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 423010, @service_area = 'MI-12'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 436183, @service_area = 'OH-23'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 447030, @service_area = 'VA-18'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 449041, @service_area = 'WV-5'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 514020, @service_area = 'IL-6'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 515030, @service_area = 'IN-5'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 516006, @service_area = 'IA-3'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 517001, @service_area = 'KS-1'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 524030, @service_area = 'MN-5'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 526010, @service_area = 'MO-3'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 528020, @service_area = 'NE-4'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 535007, @service_area = 'ND-3'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 550010, @service_area = 'WI-5'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 550020, @service_area = 'WI-2'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 610020, @service_area = 'FL-17'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 611020, @service_area = 'GA-2'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 625071, @service_area = 'MS-10'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 634032, @service_area = 'NC-5'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 641030, @service_area = 'SC-8'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 703030, @service_area = 'AZ-3'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 703050, @service_area = 'AZ-5'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 703068, @service_area = 'AZ-2'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 705158, @service_area = 'CA-1'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 706060, @service_area = 'CO-6'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 732010, @service_area = 'NM-5'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 737066, @service_area = 'OK-3'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 742018, @service_area = 'SD-4'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 744100, @service_area = 'TX-15' --190 -> 118
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 745000, @service_area = 'UT-1'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 751038, @service_area = 'WY-4'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 805260, @service_area = 'CA-31'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 829050, @service_area = 'NV-1'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 902000, @service_area = 'AK-1'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 913000, @service_area = 'ID-1'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 927000, @service_area = 'MT-1'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 938004, @service_area = 'OR-6'
EXEC spLSC_REMOVE_DUPLICATE_GAR_TASK_ASSIGNMENTS @recipient_id = 948010, @service_area = 'WA-1'

