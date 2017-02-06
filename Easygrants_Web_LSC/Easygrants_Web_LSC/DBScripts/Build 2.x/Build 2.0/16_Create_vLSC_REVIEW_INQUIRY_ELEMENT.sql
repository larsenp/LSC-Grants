/****** Object:  View [dbo].[vLSC_REVIEW_INQUIRY_ELEMENT]    Script Date: 05/09/2008 10:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_REVIEW_INQUIRY_ELEMENT]

AS

SELECT e.id,
	e.lsc_review_inquiry_id,
	e.lsc_review_subtopic_id,
	e.lsc_review_element_type_id,
	e.sort_order,
	e.description,
	e.end_date,
	NULL AS subtopic_alpha
	FROM LSC_a_REVIEW_INQUIRY i 
		JOIN LSC_a_REVIEW_ELEMENT e on i.id = e.lsc_review_inquiry_id

UNION ALL

SELECT e.id,
	s.lsc_review_inquiry_id,
	e.lsc_review_subtopic_id,
	e.lsc_review_element_type_id,
	e.sort_order,
	e.description,
	e.end_date,
	s.abbr AS subtopic_alpha
	FROM LSC_a_REVIEW_INQUIRY i 
		join LSC_a_REVIEW_SUBTOPIC s on i.id = s.lsc_review_inquiry_id
		join LSC_a_REVIEW_ELEMENT e on s.id = e.lsc_review_subtopic_id
