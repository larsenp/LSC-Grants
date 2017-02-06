--Base dates for subgrant requests on subgrant term, not on funding cycle.
--Mantis 3220
/****** Object:  View [dbo].[vWFTA_COMPETITION_YEAR]    Script Date: 11/18/2011 15:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vWFTA_COMPETITION_YEAR]

AS
--For NIC and competitive application, TIG LOI and application, and all Subgrants task assignments, use year of project
select wfta.wf_task_assignment_id, 
	tp.id time_period_id,
	tp.sort_order wfta_year,
	NULL as report_cycle_time_period_id,
	NULL AS report_cycle_year,
	NULL AS lsc_gar_cycle_id,
    tp.sort_order-1 wfta_year_current  --year to display on current expenses and Revenue form (D-2, D-4 Competition).
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project wfp on gp.wf_project_id = wfp.id
		join a_competition c on wfp.competition_id = c.id
		join c_time_period tp on wfp.time_period_id = tp.id
		join a_wf_task wft on wfta.wf_task_id = wft.id
	where wfta.wf_task_id in (1, 2, 66)
		or (c.program_id = 2 and wft.wf_task_type_id = 1)
		or (c.program_id = 2 and wft.wf_task_type_id <> 1 and wfta.review_cycle_stage_id is null)
		--or (c.program_id = 3 and wfta.review_cycle_stage_id is null)

union all

--For renewal applications, certification uploads, and GAR, use year of project adjusted with WF_TASK_ASSIGNMENT.award_term_id
select wfta.wf_task_assignment_id, 
	tp_wfta.id time_period_id,
	tp_wfta.sort_order wfta_year,
	tp_rc.id report_cycle_time_period_id,
	tp_rc.sort_order report_cycle_year,
	gc.id lsc_gar_cycle_id,
    NULL AS wfta_year_current
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project wfp on gp.wf_project_id = wfp.id
		join a_competition c on wfp.competition_id = c.id
		join c_time_period tp_gp on wfp.time_period_id = tp_gp.id
		join a_wf_task wft on wfta.wf_task_id = wft.id
		join c_time_period tp_wfta on tp_gp.sort_order + wfta.award_term_id - 1 = tp_wfta.sort_order
		left join lsc_a_wf_task lwft on wft.id = lwft.wf_task_id
		left join c_time_period tp_rc on tp_rc.sort_order = 
				case when lwft.is_projected = 1 then tp_wfta.sort_order - 1
					else tp_wfta.sort_order end
			and wft.wf_task_type_id = 3
		left join lsc_c_gar_cycle gc on tp_rc.sort_order = gc.sort_order
	where c.program_id = 1 
		and (wfta.wf_task_id in (4,7,67) or wft.wf_task_type_id = 3)

union all

--For reviews of applications, use LSC_REVIEW_CYCLE_STAGE.time_period_id
select wfta.wf_task_assignment_id, 
	rcs.time_period_id,
	tp.sort_order wfta_year,
	NULL as report_cycle_time_period_id,
	NULL AS report_cycle_year,
	NULL AS lsc_gar_cycle_id,
    NULL AS wfta_year_current
	from wf_task_assignment wfta
		join a_wf_task wft on wfta.wf_task_id = wft.id
		join lsc_review_cycle_stage rcs on wfta.review_cycle_stage_id = rcs.review_cycle_stage_id
		join c_time_period tp on rcs.time_period_id = tp.id
	where wft.wf_task_type_id = 4

union all

--For all Subgrants task assignments, use year from Start_date of lsc_wfta_subgrant

select wfta.wf_task_assignment_id,
	tp.id time_period_id,
    --Year(wftas.start_date) wfta_year,
    tp.sort_order wfta_year,
	NULL as report_cycle_time_period_id,
	NULL AS report_cycle_year,
	NULL AS lsc_gar_cycle_id,
    NULL AS wfta_year_current  
	from wf_task_assignment wfta
        join LSC_WFTA_SUBGRANT wftas on wftas.wf_task_assignment_id = wfta.wf_task_assignment_id
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project wfp on gp.wf_project_id = wfp.id
		join a_competition c on wfp.competition_id = c.id
        join c_time_period tp on Year(wftas.start_date) = tp.abbr
		join a_wf_task wft on wfta.wf_task_id = wft.id
	where c.program_id = 3 and wfta.review_cycle_stage_id is null

