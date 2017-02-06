/****** Object:  View [dbo].[vLSC_PDF_RFP_INQUIRIES]    Script Date: 03/18/2013 16:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_PDF_RFP_INQUIRIES]

AS

SELECT wfta.wf_task_assignment_id
	,rai.lsc_review_assignment_inquiry_id
	,rai.comment
	,q.abbr q
	,q.description inquiry
	,[dbo].[fnSubtopicsByInquiry] (q.id, 'text') subtopics
	,q.description + char(10) + char(13) + [dbo].[fnSubtopicsByInquiry] (q.id, 'text') inquiry_and_subtopics
	,q.sort_order q_sort
	,c.abbr c
	,c.description criterion
	,pa.sort_order pa
	,pa.description performance_area
	,CASE WHEN q.abbr LIKE 'F%' THEN 1 ELSE 0 END is_chart
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa ON wcy.time_period_id = pa.time_period_id
		JOIN LSC_a_REVIEW_CATEGORY cat ON pa.id = cat.lsc_review_performance_area_id
		JOIN LSC_a_REVIEW_CRITERION c ON cat.id = c.lsc_review_category_id
		JOIN LSC_a_REVIEW_INQUIRY q ON c.id = q.lsc_review_criterion_id
		LEFT JOIN LSC_REVIEW_ASSIGNMENT_INQUIRY rai ON wfta.wf_task_assignment_id = rai.wf_task_assignment_id
			AND q.id = rai.lsc_review_inquiry_id
