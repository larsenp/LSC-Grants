ALTER VIEW [dbo].[vLSC_COMP_REVIEW_COMMENTS_SUMMARY]

AS
select cast(wfta.wf_task_assignment_id as varchar(10)) + '_' + cast(pa.sort_order as varchar(3)) + '_' + 
	cast(c.abbr as varchar(3)) + '_' + cast(q.sort_order as varchar(3)) comments_summary_key,
 wfta.wf_task_assignment_id,
 vq.inquiry_full_spec,
 rai.comment,
 pa.sort_order pa_order,
 c.abbr c_order,
 q.sort_order q_order
 from wf_task_assignment wfta
  join vwfta_competition_year wcy on wcy.wf_task_assignment_id = wfta.wf_task_assignment_id
  join lsc_a_review_performance_area pa on pa.time_period_id = wcy.time_period_id
  join lsc_a_review_category cat on cat.lsc_review_performance_area_id = pa.id
  join lsc_a_review_criterion c on c.lsc_review_category_id = cat.id
  join lsc_a_review_inquiry q on q.lsc_review_criterion_id = c.id
  join vLSC_a_REVIEW_INQUIRY vq on q.id = vq.id
  left join lsc_review_assignment_inquiry rai on wfta.wf_task_assignment_id = rai.wf_task_assignment_id 
   and q.id = rai.lsc_review_inquiry_id
 where wfta.wf_task_id = 5