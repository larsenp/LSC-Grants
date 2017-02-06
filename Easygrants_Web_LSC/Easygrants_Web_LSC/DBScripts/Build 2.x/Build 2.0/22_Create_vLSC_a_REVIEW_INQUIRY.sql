CREATE VIEW vLSC_a_REVIEW_INQUIRY
AS

select  i.id,
	'PA' + CAST(pa.sort_order AS varchar(10)) + ', C' + c.abbr + ', Q #' + i.abbr + '. ' + dbo.[fnInquiryPlusSubtopics](i.id) AS inquiry_full_spec,
	CASE WHEN i.description IS NULL THEN dbo.fnSubtopicsByInquiry(i.id) ELSE i.description END AS description_or_subtopic
	from lsc_a_review_inquiry i
		join lsc_a_review_criterion c on i.lsc_review_criterion_id = c.id
		join lsc_a_review_performance_area pa on c.lsc_review_performance_area_id = pa.id
